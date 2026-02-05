return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

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

    -- Load language-specific configs
    require("lsp.langs.python").setup(capabilities)
    require("lsp.langs.lua").setup(capabilities)
    require("lsp.langs.typescript").setup(capabilities)
  end,
}
