return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      background = {
        dark = "wave"
      },
      colors = {
        palette = {
          fujiWhite = "#A98FBF", -- Default foreground [changed] #DCD7BA #7FDBFF #CBC3E3
          oldWhite = "#C8C0FF", -- Dark foreground (statuslines) [changed] #C8C093 #C8C0FF
          sumiInk0 = "#16161D", -- Dark background (statuslines and floating windows) [default] #16161D
          sumiInk1 = "#1F1F28", -- Default background [default]
          sumiInk2 = "#2A2A37", -- Lighter background (colorcolumn, folds) [default]
          sumiInk3 = "#363646", -- Lighter background (cursorline) [default]
          sumiInk4 = "#54546D", -- Darker foreground (line numbers, fold column, non-text characters), float borders [default] #54546D
          waveBlue1 = "#543212", -- Popup background, visual selection background [changed] #223249
          waveBlue2 = "#2D4F67", -- Popup selection background, search background [default] #2D4F67
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
          fujiGray = "#3C5A5A", -- Comments [changed] #727169
          springViolet1 = "#938AA9", -- Light foreground [default]
          oniViolet = "#FF6961", -- Statements and Keywords [changed] #957FB8
          crystalBlue = "#7FDBFF", -- Functions and Titles [changed] #7E9CD8 #A6A9B7 [#7FDBFF #8ED8E4 #56C1D6]
          springViolet2 = "#9CABCA", -- Brackets and punctuation [default] #9CABCA
          springBlue = "#7FB4CA", -- Specials and builtin functions [default] #7FB4CA
          lightBlue = "#A3D4D5", -- Not used [default]
          waveAqua2 = "#7F66C9", -- Types [changed] #7AA89F #658594 #6BE4E7 #CBC3E3
          springGreen = "#E58D7F", -- Strings [default] #98BB6C
          boatYellow1 = "#938056", -- Not used [default]
          boatYellow2 = "#FF7777", -- Operators, RegEx [changed] #C0A36E
          carpYellow = "#7A72B8", -- Identifiers [changed] #E6C384 #9B7CE1 
          sakuraPink = "#957FB8", -- Numbers [changed] #D27E99
          waveRed = "#FF7777", -- Standout specials 1 (builtin variables) [changed] #E46876
          peachRed = "#E13C6B", -- Standout specials 2 (exception handling, return) [changed]
          surimiOrange = "#FFA066", -- Constants, imports, booleans [changed]
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
