local key = vim.keymap

vim.g.mapleader = " "

---- Remove Binds ----

---- Aliases ----

-- Text Manipulation --
key.set('i', '<C-H>', '<C-W>', { noremap = true, silent = true }) -- ctrl + backspace deletes the word before the cursor in insert mode 

-- Saving/Quitting --
key.set("n", "<leader>wq", ":wqa<CR>") -- write&quit all
key.set("n", "<leader>wa", ":wa<CR>") -- write all
key.set("n", "<leader>qq", ":q!<CR>") -- quit without saving

-- Tab Management --
key.set("n", "<A-n>", ":tabnew<CR>") -- open a new tab
key.set("n", "<A-w>", ":tabclose<CR>") -- close a tab
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
key.set("n", "<leader>cs", ":Telescope colorscheme<CR>", { noremap = true, silent = true }) -- open color scheme menu

-- NeoTree --
key.set("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true}) -- toggle Neotree
