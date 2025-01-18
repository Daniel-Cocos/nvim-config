return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local function openNeotreeAndEnableTransparent()
        vim.cmd("Neotree filesystem reveal left")
        vim.cmd("TransparentEnable")
        vim.opt.laststatus = 0
      end
      vim.keymap.set("n", "<Leader>n", openNeotreeAndEnableTransparent)
    end,
  },
}
