return {
	{
		"tpope/vim-dadbod",
		lazy = true,
		cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer" },
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "tpope/vim-dadbod" },
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		keys = {
			{ "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_win_position = "left"
			vim.g.db_ui_show_help = 0
		end,
	},
	{
		"kristijanhusak/vim-dadbod-completion",
		dependencies = { "tpope/vim-dadbod" },
		ft = { "sql", "mysql", "plsql" },
		init = function()
			-- find the project main file the root so I knoow where to put the .db file
			local function detect_root()
				local buf = vim.api.nvim_get_current_buf()
				local bufpath = vim.api.nvim_buf_get_name(buf)
				local start = (bufpath ~= "" and vim.fs.dirname(bufpath)) or vim.loop.cwd()
				local markers = { ".git", ".sqls.yml", "flake.nix", "package.json" }
				local found = vim.fs.find(markers, { upward = true, path = start })[1]
				return found and vim.fs.dirname(found) or start
			end

			-- set dadbod to sqlite if it aint
			local function set_sqlite_db(dbname)
				local root = detect_root()
				local base = vim.fn.fnamemodify(root, ":t")
				local name = dbname or (base .. ".db")
				local db_path = vim.fs.joinpath(root, name)
				local norm = vim.fs.normalize(db_path)

				-- Create the file if it dont exist
				local stat = vim.loop.fs_stat(norm)
				if not stat then
					local fd = vim.loop.fs_open(norm, "w", 420) -- 0644
					if fd then
						vim.loop.fs_close(fd)
					end
				end

				vim.b.db = "sqlite:///" .. norm
				vim.notify("Dadbod connection set: " .. vim.b.db)
			end

			vim.api.nvim_create_user_command("DBSetSqlite", function(opts)
				set_sqlite_db(opts.args ~= "" and opts.args or nil)
			end, { nargs = "?" })

			-- binds and stuff
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "sql", "mysql", "plsql" },
				callback = function()
					vim.bo.omnifunc = "vim_dadbod_completion#omni"

					-- Run queries
					vim.keymap.set(
						"n",
						"<leader>rq",
						":%DB<CR>",
						{ buffer = true, silent = true, desc = "Run buffer query" }
					)
					vim.keymap.set(
						"v",
						"<leader>rq",
						":'<,'>DB<CR>",
						{ buffer = true, silent = true, desc = "Run selected query" }
					)

					-- link dbs
					vim.keymap.set("n", "<leader>dd", function()
						set_sqlite_db("dev.db") -- quick: dev.db in project root
					end, { buffer = true, desc = "Use SQLite dev.db in project root" })

					-- dbs rename
					vim.keymap.set("n", "<leader>dn", function()
						local root = detect_root()
						local default = vim.fn.fnamemodify(root, ":t") .. ".db"
						local name = vim.fn.input("SQLite DB filename: ", default)
						if name ~= "" then
							set_sqlite_db(name)
						end
					end, { buffer = true, desc = "Pick SQLite DB filename in project root" })
				end,
			})
		end,
	},
}
