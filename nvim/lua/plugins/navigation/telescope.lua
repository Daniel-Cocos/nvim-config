return {
	{
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set('n', '<leader>aa', builtin.find_files, {})
    vim.keymap.set('n', '<leader>an', function()
      vim.cmd('tabnew')         -- open a new tab
      require('telescope.builtin').find_files() -- run Telescope
    end, {})
		vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
	end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			}
			require("telescope").load_extension("ui-select")
		end
	}
}
