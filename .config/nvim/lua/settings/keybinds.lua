local key = vim.keymap

vim.g.mapleader = " "

---- Remove Binds ----

---- Aliases ----

-- Saving/Quitting --
key.set("n", "<leader>wq", ":wqa<CR>")
key.set("n", "<leader>wa", ":wa<CR>")
key.set("n", "<leader>qq", ":q!<CR>")

-- Tab Management --
key.set("n", "<A-n>", ":tabnew<CR>") -- open a new tab
key.set("n", "<A-w>", ":tabclose<CR>") -- close a tab
key.set("n", "<A-l>", ":tabn<CR>") -- next tab
key.set("n", "<A-h>", ":tabp<CR>") -- previous tab

-- Split Windows --
key.set("n", "<leader>sv", "<C-w>v") -- split window vertically
key.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
key.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
key.set("n", "<leader>sx", ":close<CR>") -- close current split window
key.set("n", "<leader>sj", "<C-w>-") -- make split window height shorter
key.set("n", "<leader>sk", "<C-w>+") -- make split windows height taller
key.set("n", "<leader>sl", "<C-w>>5") -- make split windows width bigger 
key.set("n", "<leader>sh", "<C-w><5") -- make split windows width smaller
key.set("n", "<C-j>", ":wincmd j<CR>") -- navigate down a window
key.set("n", "<C-k>", ":wincmd k<CR>") -- navigate up a window
key.set("n", "<C-h>", ":wincmd h<CR>") -- navigate left a window
key.set("n", "<C-l>", ":wincmd l<CR>") -- navigate right a window

---- Plugins ----

-- Telescope --
key.set("n", "<leader>cs", ":Telescope colorscheme<CR>", { noremap = true, silent = true })

-- NeoTree --
key.set("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true})
