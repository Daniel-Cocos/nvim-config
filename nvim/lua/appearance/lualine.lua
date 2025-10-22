return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local colors = {
      ivoryMist    = "#F8F8F0",
      samuraiRed   = "#E82424",
      hazardOrange = "#FF9E3B",
      mutedTeal    = "#3BA7A4",
    }

    local function diag_count(severity)
      return #vim.diagnostic.get(0, { severity = severity })
    end

    -- empty component to force spacing
    local empty = require('lualine.component'):extend()
    function empty:draw(default_highlight)
      self.status            = ''
      self.applied_separator = ''
      self:apply_highlights(default_highlight)
      self:apply_section_separators()
      return self.status
    end

    local function process_sections(sections)
      for name, section in pairs(sections) do
        local is_left = name:sub(9, 10) < 'x'
        for pos = 1, (name ~= 'lualine_z' and #section or #section - 1) do
          table.insert(section, pos * 2, { empty, color = { fg = colors.ivoryMist, bg = 'NONE' } })
        end
        for idx, comp in ipairs(section) do
          if type(comp) ~= 'table' then
            comp = { comp }
            section[idx] = comp
          end
          comp.separator = is_left and { right = ' ' } or { left = ' ' }
        end
      end
      return sections
    end

    local devicons = require('nvim-web-devicons')

    require('lualine').setup {
      options = {
        component_separators = '',
        section_separators   = { left = ' ', right = ' ' },
        theme = {
          normal = {
            a = { fg = colors.ivoryMist, bg = 'NONE' },
            b = { fg = colors.ivoryMist, bg = 'NONE' },
            c = { fg = colors.ivoryMist, bg = 'NONE' },
            z = { fg = colors.ivoryMist, bg = 'NONE' },
          },
          insert  = { a = { fg = colors.ivoryMist, bg = 'NONE' } },
          visual  = { a = { fg = colors.ivoryMist, bg = 'NONE' } },
          replace = { a = { fg = colors.ivoryMist, bg = 'NONE' } },
          command = { a = { fg = colors.ivoryMist, bg = 'NONE' } },
          inactive = {
            a = { fg = colors.ivoryMist, bg = 'NONE' },
            b = { fg = colors.ivoryMist, bg = 'NONE' },
            c = { fg = colors.ivoryMist, bg = 'NONE' },
            z = { fg = colors.ivoryMist, bg = 'NONE' },
          },
        },
        icons_enabled      = true,
        disabled_filetypes = {},
        globalstatus       = true,
      },

      sections = process_sections {
        lualine_a = {},

        -- show Git branch icon if in a git repo
        lualine_b = {
          {
            function()
              return ''
            end,
            cond = function()
              return vim.fn.isdirectory('.git') == 1
                or vim.fn.finddir('.git', vim.fn.expand('%:p:h') .. ';') ~= ''
            end,
            color = { fg = colors.ivoryMist, bg = 'NONE', gui = 'bold' },
          },

          -- error count element
          {
            function()
              local n = diag_count(vim.diagnostic.severity.ERROR)
              return ' ' .. n
            end,
            cond = function()
              return diag_count(vim.diagnostic.severity.ERROR) > 0
            end,
            color = function()
              local n = diag_count(vim.diagnostic.severity.ERROR)
              return { fg = n > 0 and colors.samuraiRed or colors.ivoryMist, bg = 'NONE' }
            end,
            padding = { left = 1, right = 0 },
          },

          -- warning count element
          {
            function()
              local n = diag_count(vim.diagnostic.severity.WARN)
              return ' ' .. n
            end,
            cond = function()
              return diag_count(vim.diagnostic.severity.WARN) > 0
            end,
            color = function()
              local n = diag_count(vim.diagnostic.severity.WARN)
              return { fg = n > 0 and colors.hazardOrange or colors.ivoryMist, bg = 'NONE' }
            end,
            padding = { left = 1, right = 0 },
          },

          -- info count element
          {
            function()
              local n = diag_count(vim.diagnostic.severity.INFO)
              return '🛈' .. n
            end,
            cond = function()
              return diag_count(vim.diagnostic.severity.INFO) > 0
            end,
            color = function()
              local n = diag_count(vim.diagnostic.severity.INFO)
              return { fg = n > 0 and colors.mutedTeal or colors.ivoryMist, bg = 'NONE' }
            end,
            padding = { left = 1, right = 0 },
          },

          -- filename element
          {
            'filename',
            file_status = false,
            path = 1,
            color = { fg = colors.ivoryMist, bg = 'NONE' },
            fmt = function(str)
              return str ~= '' and str or '[No Name]'
            end,
            padding = { left = 1, right = 0 },
          },

          -- if file is modified show plus sign [+]
          {
            function()
              return vim.bo.modified and '[+]' or ''
            end,
            color = { fg = colors.hazardOrange, bg = 'NONE', gui = 'bold' },
            cond = function() return vim.bo.modified end,
            padding = { left = 1, right = 0 },
          },
        },

        lualine_c = {},
        lualine_x = {},

        -- devicons element
        lualine_y = {
          {
            function()
              local name = vim.fn.expand("%:t")
              local ext  = vim.fn.expand("%:e")
              local icon = devicons.get_icon(name, ext, { default = false })
              return icon or ''
            end,
            color = function()
              local name = vim.fn.expand("%:t")
              local ext  = vim.fn.expand("%:e")
              local _, icon_color = devicons.get_icon_color(name, ext, { default = false })
              local fg = icon_color or colors.ivoryMist
              return { fg = fg, bg = 'NONE' }
            end,
            padding = { left = 1, right = 1 },
          },
        },

        lualine_z = {
          { '%l/%L', color = { fg = colors.ivoryMist, bg = 'NONE' } },
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            function()
              local name = vim.fn.expand('%:t')
              return name ~= '' and name or '[No Name]'
            end,
            color = { fg = colors.ivoryMist, bg = 'NONE' },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },

      extensions = {},
    }
  end,
}
