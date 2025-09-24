local vim = vim
local opts = { noremap = true, silent = true}

vim.g.mapleader = " " -- Set space as <leader>

---- Remove Binds ----

---- Aliases ----

-- Text Manipulation --
vim.keymap.set('i', '<C-BS>', '<C-W>', opts) -- deletes the word before the cursor in insert mode
vim.keymap.set('n', '<C-BS>', 'db', opts) -- deletes the word before the cursor in normal mode
vim.keymap.set("v", "p", '"_dP', opts) -- keep paste buffer even when replacing highlighted text

-- Saving/Quitting --
vim.keymap.set("n", "<leader>qa", ":qa!<CR>") -- quit all without saving
vim.keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
vim.keymap.set("n", "<leader>wa", ":wa<CR>") -- write all
vim.keymap.set("n", "<leader>wq", ":wqa<CR>") -- write&quit all

-- Tab Management --
vim.keymap.set("n", "<A-n>", ":tabnew<CR>") -- open a new tab
vim.keymap.set("n", "<A-w>", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<A-l>", ":tabn<CR>") -- next tab
vim.keymap.set("n", "<A-h>", ":tabp<CR>") -- previous tab
vim.keymap.set("n", "<A-1>", ":tabn 1<CR>") -- go to the 1st tab
vim.keymap.set("n", "<A-2>", ":tabn 2<CR>") -- go to the 2nd tab
vim.keymap.set("n", "<A-3>", ":tabn 3<CR>") -- go to the 3rd tab
vim.keymap.set("n", "<A-4>", ":tabn 4<CR>") -- go to the 4th tab
vim.keymap.set("n", "<A-5>", ":tabn 5<CR>") -- go to the 5th tab
vim.keymap.set("n", "<A-6>", ":tabn 6<CR>") -- go to the 6th tab
vim.keymap.set("n", "<A-7>", ":tabn 7<CR>") -- go to the 7th tab
vim.keymap.set("n", "<A-8>", ":tabn 8<CR>") -- go to the 8th tab
vim.keymap.set("n", "<A-9>", ":tabn 9<CR>") -- go to the 9th tab
vim.keymap.set("n", "<A-0>", ":tabn 10<CR>") -- go to the 10th tab

-- Split Windows --
vim.keymap.set("n", "<C-Down>", ":wincmd j<CR>") -- navigate down a window
vim.keymap.set("n", "<C-Up>", ":wincmd k<CR>") -- navigate up a window
vim.keymap.set("n", "<C-Left>", ":wincmd h<CR>") -- navigate left a window
vim.keymap.set("n", "<C-Right>", ":wincmd l<CR>") -- navigate right a window

---- Diagnostic ----
-- Pop-up containing all diagnostic messages from current line --
vim.keymap.set("n", "<leader>p", function()
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
vim.keymap.set("n", "<leader>t", function()
  local current = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = not current })
  local status = current and "Disabled" or "Enabled"
  print("Inline diagnostics " .. status)
end, { desc = "Toggle inline diagnostics" })

---- Yank ----
-- Highlight When Yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("Highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

---- Plugins ----
-- GitSigns --
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_signs<CR>", {})

-- LspConfig --
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})  -- show hover information
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})  -- go to definition
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- code action

-- NeoTree --
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", opts) -- toggle Neotree

-- NoneLs --
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})  -- format code

-- Telescope --
vim.keymap.set("n", "<leader>cs", ":Telescope colorscheme<CR>", opts) -- open color scheme menu

-- TreeSitter --
vim.keymap.set("n", "<leader>hg", ":TSHighlightCapturesUnderCursor<CR>", {}) -- display highlight group


vim.keymap.set("n", "<leader>fa", function()
  vim.cmd("tabnew")
  vim.ui.input({prompt = "New file path: "}, function(input)
    if not input or input == "" then return end
    -- create directories if necessary
    local dir = vim.fn.fnamemodify(input, ":h")
    if dir ~= "" and vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
    -- create file (if not exists) and open it
    vim.cmd("edit " .. vim.fn.fnameescape(input))
  end)
end, { desc = "New tab + prompt for file path and open it" })
---- Combos ----
