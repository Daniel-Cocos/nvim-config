local M = {}

local function merge_lang_configs(langs)
	local all = { servers = {}, formatters = {}, linters = {} }
	for _, m in ipairs(langs) do
		local ok, cfg = pcall(require, m)
		if ok and type(cfg) == "table" then
			vim.list_extend(all.servers, cfg.servers or {})
			for ft, v in pairs(cfg.formatters or {}) do
				all.formatters[ft] = v
			end
			for ft, v in pairs(cfg.linters or {}) do
				all.linters[ft] = v
			end
		end
	end
	return all
end

function M.setup()
	local langs = {
		"langs.css",
		"langs.python",
		"langs.c",
		"langs.html",
		"langs.java",
		"langs.nix",
		"langs.lua",
		"langs.javascript",
		"langs.markdown",
		"langs.sql",
	}

	local cfg = merge_lang_configs(langs)

	local lspconfig = require("lspconfig")

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local ok_blink, blink = pcall(require, "blink.cmp")
	if ok_blink and type(blink.get_lsp_capabilities) == "function" then
		capabilities = blink.get_lsp_capabilities(capabilities)
	else
		capabilities.textDocument.completion = capabilities.textDocument.completion or {}
		local ci = capabilities.textDocument.completion.completionItem or {}
		ci.snippetSupport = true
		capabilities.textDocument.completion.completionItem = ci
	end

	local function setup_server(name, opts)
		local srv = name
		if not lspconfig[name] and name == "ts_ls" and lspconfig.tsserver then
			srv = "tsserver"
		end
		if lspconfig[srv] then
			lspconfig[srv].setup(opts)
		else
			vim.notify("Unknown LSP server: " .. tostring(name), vim.log.levels.WARN)
		end
	end

	for _, srv in ipairs(cfg.servers) do
		local name, opts = srv.name, srv.opts or {}
		opts.capabilities = vim.tbl_deep_extend("force", {}, opts.capabilities or {}, capabilities)
		setup_server(name, opts)
	end

	local ok_conform, conform = pcall(require, "conform")
	if ok_conform then
		conform.setup({
			formatters_by_ft = cfg.formatters,
			notify_on_error = false,
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				require("conform").format({ bufnr = args.buf, lsp_fallback = true, quiet = true })
			end,
		})
	end

	local ok_lint, lint = pcall(require, "lint")
	if ok_lint then
		lint.linters_by_ft = cfg.linters
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end
end

return M
