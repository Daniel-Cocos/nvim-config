return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
    local transparent = require('settings.transparent-lualine')
		require('lualine').setup({
			options = {
        theme = transparent.theme(),
			}
		})
	end
}
