local key = vim.keymap
local opts = { noremap = true, silent = true}

vim.g.mapleader = " " -- Set space as <leader>

---- Remove Binds ----

---- Aliases ----

-- Text Manipulation --
key.set('i', '<C-BS>', '<C-W>', opts) -- deletes the word before the cursor in insert mode
key.set('n', '<C-BS>', 'db', opts) -- deletes the word before the cursor in normal mode
key.set("v", "p", '"_dP', opts) -- keep paste buffer even when replacing highlighted text

-- Saving/Quitting --
key.set("n", "<leader>qa", ":qa!<CR>") -- quit all without saving
key.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
key.set("n", "<leader>wa", ":wa<CR>") -- write all
key.set("n", "<leader>wq", ":wqa<CR>") -- write&quit all

-- Tab Management --
key.set("n", "<A-n>", ":tabnew<CR>") -- open a new tab
key.set("n", "<A-w>", ":tabclose<CR>") -- close current tab
key.set("n", "<A-l>", ":tabn<CR>") -- next tab
key.set("n", "<A-h>", ":tabp<CR>") -- previous tab
key.set("n", "<A-1>", ":tabn 1<CR>") -- go to the 1st tab
key.set("n", "<A-2>", ":tabn 2<CR>") -- go to the 2nd tab
key.set("n", "<A-3>", ":tabn 3<CR>") -- go to the 3rd tab
key.set("n", "<A-4>", ":tabn 4<CR>") -- go to the 4th tab
key.set("n", "<A-5>", ":tabn 5<CR>") -- go to the 5th tab
key.set("n", "<A-6>", ":tabn 6<CR>") -- go to the 6th tab
key.set("n", "<A-7>", ":tabn 7<CR>") -- go to the 7th tab
key.set("n", "<A-8>", ":tabn 8<CR>") -- go to the 8th tab
key.set("n", "<A-9>", ":tabn 9<CR>") -- go to the 9th tab
key.set("n", "<A-0>", ":tabn 10<CR>") -- go to the 10th tab

-- Split Windows --
key.set("n", "<C-Down>", ":wincmd j<CR>") -- navigate down a window
key.set("n", "<C-Up>", ":wincmd k<CR>") -- navigate up a window
key.set("n", "<C-Left>", ":wincmd h<CR>") -- navigate left a window
key.set("n", "<C-Right>", ":wincmd l<CR>") -- navigate right a window

---- Diagnostic ----
-- Pop-up containing all diagnostic messages from current line --
key.set("n", "<leader>p", function()
  vim.diagnostic.open_float(0, {
    scope = "line",
    focusable = true,
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  })
end, { desc = "Show line diagnostics in float" })

-- Toggle Diagnostic Messages --
key.set("n", "<leader>t", function()
  local current = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = not current })
  local status = current and "Disabled" or "Enabled"
  print("Inline diagnostics " .. status)
end, { desc = "Toggle inline diagnostics" })

---- Plugins ----
-- GitSigns --
key.set("n", "<leader>gt", ":Gitsigns toggle_signs<CR>", {})

-- LspConfig --
key.set("n", "K", vim.lsp.buf.hover, {})  -- show hover information
key.set("n", "gd", vim.lsp.buf.definition, {})  -- go to definition
key.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- code action

-- NeoTree --
key.set("n", "<C-n>", ":Neotree toggle<CR>", opts) -- toggle Neotree

-- NoneLs --
key.set("n", "<leader>gf", vim.lsp.buf.format, {})  -- format code

-- Telescope --
key.set("n", "<leader>cs", ":Telescope colorscheme<CR>", opts) -- open color scheme menu

-- TreeSitter --
key.set("n", "<leader>hg", ":TSHighlightCapturesUnderCursor<CR>", {}) -- display highlight group
