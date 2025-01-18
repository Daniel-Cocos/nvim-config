return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      background = {
        dark = "wave"
      },
      colors = {
        palette = {
          fujiWhite = "#DCD7BA", -- Default foreground [default]
          oldWhite = "#C8C093", -- Dark foreground (statuslines) [default]
          sumiInk0 = "#16161D", -- Dark background (statuslines and floating windows) [default]
          sumiInk1 = "#1F1F28", -- Default background [default]
          sumiInk2 = "#2A2A37", -- Lighter background (colorcolumn, folds) [default]
          sumiInk3 = "#363646", -- Lighter background (cursorline) [default]
          sumiInk4 = "#54546D", -- Darker foreground (line numbers, fold column, non-text characters), float borders [default]
          waveBlue1 = "#223249", -- Popup background, visual selection background [default]
          waveBlue2 = "#2D4F67", -- Popup selection background, search background [default]
          winterGreen = "#2B3328", -- Diff Add (background) [default]
          winterYellow = "#49443C", -- Diff Change (background) [default]
          winterRed = "#43242B", -- Diff Deleted (background) [default]
          winterBlue = "#252535", -- Diff Line (background) [default]
          autumnGreen = "#76946A", -- Git Add [default]
          autumnRed = "#C34043", -- Git Delete [default]
          autumnYellow = "#DCA561", -- Git Change [default]
          samuraiRed = "#E82424", -- Diagnostic Error [default]
          roninYellow = "#FF9E3B", -- Diagnostic Warning [default]
          waveAqua1 = "#6A9589", -- Diagnostic Info [default]
          dragonBlue = "#658594", -- Diagnostic Hint [default]
          fujiGray = "#727169", -- Comments [default]
          springViolet1 = "#938AA9", -- Light foreground [default]
          oniViolet = "#957FB8", -- Statements and Keywords [default]
          crystalBlue = "#7E9CD8", -- Functions and Titles [default]
          springViolet2 = "#9CABCA", -- Brackets and punctuation [default]
          springBlue = "#7FB4CA", -- Specials and builtin functions [default]
          lightBlue = "#A3D4D5", -- Not used [default]
          waveAqua2 = "#7AA89F", -- Types [default]
          springGreen = "#98BB6C", -- Strings [default]
          boatYellow1 = "#938056", -- Not used [default]
          boatYellow2 = "#C0A36E", -- Operators, RegEx [default]
          carpYellow = "#E6C384", -- Identifiers [default]
          sakuraPink = "#D27E99", -- Numbers [default]
          waveRed = "#E46876", -- Standout specials 1 (builtin variables) [default]
          peachRed = "#FF2222", -- Standout specials 2 (exception handling, return) [changed]
          surimiOrange = "#FFA066", -- Constants, imports, booleans [default]
          katanaGray = "#717C7C", -- Deprecated [default]
        }
      }
    }
  },

  {
    "tiagovla/tokyodark.nvim",
    opts = {
        -- custom options here
    },
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  }

}
