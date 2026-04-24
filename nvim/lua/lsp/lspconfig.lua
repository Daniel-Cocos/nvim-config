return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Set default capabilities for all LSP servers
    vim.lsp.config('*', {
      capabilities = capabilities,
    })

    -- Keybinds (applied when LSP attaches to buffer)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end,
    })

    -- Load language-specific configs (they call vim.lsp.config + vim.lsp.enable)
    require("lsp.langs.python").setup()
    require("lsp.langs.lua").setup()
    require("lsp.langs.typescript").setup()
    require("lsp.langs.nix").setup()
    require("lsp.langs.html").setup()
    require("lsp.langs.json").setup()
    require("lsp.langs.java").setup()
    require("lsp.langs.css").setup()
    require("lsp.langs.sql").setup()
    require("lsp.langs.c").setup()
  end,
}
