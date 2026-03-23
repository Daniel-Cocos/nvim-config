-- =============================================================================
-- Setup
-- =============================================================================
-- Enable true color support
vim.o.termguicolors = true
vim.o.background = "dark"

-- Clear any existing highlights and reset syntax
vim.cmd([[hi clear]])
if vim.fn.exists("syntax_on") then
  vim.cmd([[syntax reset]])
end

-- =============================================================================
-- Palette
-- =============================================================================
local colors = {
  -- Core
  blue = "#4885FF",
  yellow = "#FFC857",
  pink = "#FF3EA5",
  -- Neutrals
  fujiWhite = "#D0D0D0",
  white = "#FFFFFF",
  gray = "#9FABBD";
  darkGray = "#8A97AA",
  lightGray = "#B5C1D3",
  faddedIndigo = "#4C5C68",
  -- Diagnostics
  orange = "#FF9E3B",
  red = "#E82424",
  mutedBlue = "#658594",
  mutedTeal = "#3BA7A4",
}

-- =============================================================================
-- Highlight Function
-- =============================================================================
local function hi(group, opts)
  if opts.bg == true or opts.bg == "None" then
    opts.bg = "NONE"
  end
  vim.api.nvim_set_hl(0, group, opts)
end

-- =============================================================================
-- Default Highlights
-- =============================================================================
local function apply_default_highlights()
  -- UI Core
  hi("DiffText", { bg = "NONE" })
  hi("DiffAdd", { bg = "NONE" })
  hi("DiffChange", { bg = "NONE" })
  hi("DiffDelete", { bg = "NONE" })
  hi("ColorColumn", { bg = "NONE" })
  hi("CursorColumn", { bg = "NONE" })
  hi("CursorLine", { bg = "NONE" })
  hi("CursorLineNr", { fg = colors.white, bg = "None", bold = true })
  hi("LineNr", { fg = colors.gray, bg = "NONE" })
  hi("Normal", { fg = colors.fujiWhite, bg = "NONE" })
  hi("NormalFloat", { fg = colors.faddedIndigo, bg = "NONE" })
  hi("SignColumn", { bg = "NONE" })
  hi("VertSplit", { fg = colors.white, bg = "NONE" })
  hi("Visual", { bg = colors.white })

  -- Command Line
  hi("CmdlinePrompt", { fg = colors.white })
  hi("CmdlineCmd", { fg = colors.white })
  hi("CmdlineKey", { fg = colors.white })

  -- Popup Menu (right-click menu)
  hi("PopupMenu", { fg = colors.fujiWhite, bg = "NONE" })
  hi("PopupMenuSel", { fg = colors.white, bg = "NONE", bold = true })
  hi("PopupMenuSbar", { bg = "NONE" })
  hi("PopupMenuThumb", { bg = "NONE" })

  -- Popup and Completion Menu
  hi("Pmenu", { fg = colors.fujiWhite, bg = "NONE" })
  hi("PmenuSel", { fg = colors.white, bg = "NONE", bold = true })
  hi("PmenuSbar", { bg = "NONE" })
  hi("PmenuThumb", { bg = "NONE" })

  -- Search and Match
  hi("Search", { fg = colors.white, bold = true, underline = true })
  hi("IncSearch", { fg = colors.white, bold = true })
  hi("MatchParen", { fg = colors.white, bold = true })

  -- Tabs
  hi("TabLineSel", { fg = colors.white, bg = "NONE", bold = true })
  hi("TabLine", { fg = colors.fujiWhite, bg = "NONE" })
  hi("TabLineFill", { bg = "NONE" })

  -- LSP Diagnostics
  hi("DiagnosticError", { fg = colors.red })
  hi("DiagnosticWarn", { fg = colors.orange })
  hi("DiagnosticInfo", { fg = colors.mutedTeal })
  hi("DiagnosticHint", { fg = colors.mutedBlue })
  hi("DiagnosticVirtualTextError", { fg = colors.red, bg = "NONE" })
  hi("DiagnosticVirtualTextWarn", { fg = colors.orange, bg = "NONE" })
  hi("DiagnosticVirtualTextInfo", { fg = colors.mutedTeal, bg = "NONE" })
  hi("DiagnosticVirtualTextHint", { fg = colors.mutedBlue, bg = "NONE" })
  hi("DiagnosticUnderlineError", { sp = colors.red, underline = true })
  hi("DiagnosticUnderlineWarn", { sp = colors.orange, underline = true })
  hi("DiagnosticUnderlineInfo", { sp = colors.mutedTeal, underline = true })
  hi("DiagnosticUnderlineHint", { sp = colors.mutedBlue, underline = true })
  hi("DiagnosticSignError", { fg = colors.red })
  hi("DiagnosticSignWarn", { fg = colors.orange })
  hi("DiagnosticSignInfo", { fg = colors.mutedTeal })
  hi("DiagnosticSignHint", { fg = colors.mutedBlue })

  -- Git Signs
  hi("GitSignsAdd", { fg = "#98BE65", bg = "NONE" })
  hi("GitSignsChange", { fg = colors.blue, bg = "NONE" })
  hi("GitSignsDelete", { fg = colors.red, bg = "NONE" })

  -- Tree-sitter Syntax (Default)
  hi("@variable", { fg = colors.blue })
  hi("@variable.builtin", { fg = colors.blue, bold = true })
  hi("@parameter", { fg = colors.blue })
  hi("@field", { fg = colors.blue })
  hi("@property", { fg = colors.blue })
  hi("@constant", { fg = colors.gray }) -- TEMP
  hi("@constant.builtin", { fg = colors.gray, bold = true })
  hi("@function", { fg = colors.yellow })
  --hi("@function.builtin", { fg = colors.pink, bold = true })
  --hi("@function.method", { fg = colors.goldneYellow })
  --hi("@function.method.call", { fg = colors.yellow, bold = true })
  hi("@constructor", { fg = colors.gray })
  hi("@type", { fg = colors.gray })
  hi("@type.builtin", { fg = colors.pink, bold = true })
  hi("@attribute", { fg = colors.yellow })
  hi("@keyword", { fg = colors.pink, bold = true })
  --hi("@keyword.import", { fg = colors.pink, bold = true })
  --hi("@keyword.return", { fg = colors.pink, bold = true })
  -- hi("@keyword.function", { fg = colors.deepLilac, bold = true })
  hi("@keyword.modifier", { fg = colors.pink })
  --hi("@keyword.class", { fg = colors.white })
  hi("@operator", { fg = colors.lightGray })
  hi("@punctuation", { fg = colors.darkGray })
  hi("@punctuation.special", { fg = colors.darkGray })
  hi("@string", { fg = colors.gray })
  hi("@string.special", { fg = colors.blue })
  hi("@character", { fg = colors.yellow })
  --hi("@string.escape", { fg = colors.gray })
  --hi("@string.regexp", { fg = colors.gray })
  --hi("@string.special.path", { fg = colors.gray })
  hi("@number", { fg = colors.pink, bold = true })
  hi("@number.float", { fg = colors.pink, bold = true })
  hi("@boolean", { fg = colors.yellow, bold = true })
  hi("@comment", { fg = colors.faddedIndigo, italic = true })
  hi("@spell", { fg = colors.faddedIndigo, italic = true })
  hi("@tag", { fg = colors.pink })
  --hi("@tag.attribute", { fg = colors.white })
  --hi("@tag.builtin", { fg = colors.accentBlue })
  --hi("@tag.delimiter", { fg = colors.faddedIndigo })
  --hi("@markup.heading", { fg = colors.mutedBlue })
  --hi("@markup.raw.block", { fg = colors.yellow, bg = "None", bold = true })
  hi("@module", { fg = "#549CB4", bg = "None" })

  -- Other Plugins
  -- CMP, Noice, LuaLine, Telescope
  hi("FloatBorder", { fg = colors.white, bg = "NONE" })
  hi("CmpCursorLine", { fg = colors.white, bg = "NONE", bold = true })
  hi("CmpItemAbbr", { fg = colors.fujiWhite })
  hi("CmpItemAbbrMatch", { fg = colors.pink, bold = true })
  hi("CmpItemMenu", { fg = colors.gray })
  hi("CmpItemKindFunction", { fg = colors.gray })
  hi("CmpItemKindMethod", { fg = colors.gray })
  hi("CmpItemKindField", { fg = colors.gray })
  hi("CmpItemKindFile", { fg = colors.gray })
  hi("CmpItemKindFolder", { fg = colors.gray })
  hi("CmpItemKindKeyword", { fg = colors.gray })
  hi("CmpItemKindVariable", { fg = colors.gray })
  hi("CmpItemKindValue", { fg = colors.gray })
  hi("CmpItemKindColor", { fg = colors.gray })
  hi("CmpItemKindConstant", { fg = colors.gray })
  hi("CmpItemKindConstructor", { fg = colors.gray })
  hi("CmpItemKindClass", { fg = colors.gray })
  hi("CmpItemKindEnum", { fg = colors.gray })
  hi("CmpItemKindEnumMember", { fg = colors.gray })
  hi("CmpItemKindText", { fg = colors.gray })
  hi("CmpItemKindSnippet", { fg = colors.gray })
  hi("CmpItemKindStruct", { fg = colors.gray })
  hi("CmpItemKindInterface", { fg = colors.gray })
  hi("CmpItemKindModule", { fg = colors.gray })
  hi("CmpItemKindProperty", { fg = colors.gray })
  hi("CmpItemKindReference", { fg = colors.gray })

  -- Noice
  hi("NoiceCmdline", { fg = colors.fujiWhite, bg = "NONE" })
  hi("NoiceCmdlinePopup", { fg = colors.fujiWhite, bg = "NONE" })
  hi("NoiceCmdlinePopupBorder", { fg = colors.white, bg = "NONE" })
  hi("NoiceCmdlinePopupTitle", { fg = colors.white, bg = "NONE" })
  hi("NoiceCmdlineIcon", { fg = colors.white, bg = "NONE" })
  hi("NoicePopup", { fg = colors.fujiWhite, bg = "NONE" })
  hi("NoicePopupBorder", { fg = colors.white, bg = "NONE" })
  hi("NoicePopupmenu", { fg = colors.fujiWhite, bg = "NONE" })
  hi("NoicePopupmenuBorder", { fg = colors.white, bg = "NONE" })
  hi("NoiceConfirm", { fg = colors.fujiWhite, bg = "NONE" })
  hi("NoiceConfirmBorder", { fg = colors.white, bg = "NONE" })
  hi("NoiceCmdlineIconSearch", { fg = colors.white, bg = "NONE" })

  -- Blink.cmp
  hi("BlinkCmpMenu", { fg = colors.fujiWhite, bg = "NONE" })
  hi("BlinkCmpMenuBorder", { fg = colors.white, bg = "NONE" })
  hi("BlinkCmpMenuSelection", { fg = colors.blue, bg = "NONE", bold = true })
  hi("BlinkCmpDoc", { fg = colors.fujiWhite, bg = "NONE" })
  hi("BlinkCmpDocBorder", { fg = colors.white, bg = "NONE" })
  hi("BlinkCmpDocSeparator", { fg = colors.white, bg = "NONE" })
  hi("BlinkCmpLabel", { fg = colors.white, bold = true })
  hi("BlinkCmpLabelMatch", { fg = colors.pink, bold = true })
  hi("BlinkCmpLabelDescription", { fg = colors.gray })
  hi("BlinkCmpKind", { fg = colors.pink })

  hi("StatusLine", { fg = colors.white, bg = "NONE" })
  hi("StatusLineNC", { fg = colors.gray, bg = "NONE" })

  hi("TelescopeSelection", { bg = "NONE", bold = true })
  hi("TelescopeMatching", { fg = colors.pink, bold = true })
  hi("TelescopeNormal", { fg = colors.fujiWhite, bg = "NONE" })
  hi("TelescopeBorder", { fg = colors.white, bg = "NONE" })

  hi("NotifyBackground", { bg = colors.white })
end

-- =============================================================================
-- Language-Specific Overrides
-- =============================================================================
local language_overrides = {
  -- Python: Keywords, decorators, and self
  python = {
    --["@keyword"] = { fg = colors.white, bold = true }, -- def, class, if
    --["@attribute"] = { fg = colors.white, italic = true }, -- @decorators
    --["@variable.builtin"] = { fg = colors.pink, italic = true }, -- self
    --["@type"] = { fg = colors.gray },
    --["@function"] = { fg = colors.gray },
    ["@function.builtin"] = { fg = colors.pink, bold = true },
  },
  markdown = {
    ["@spell"] = { fg = colors.white },
    ["@markup.heading"] = { fg = colors.white, bold = true },
    ["@markup.raw.block"] = { fg = colors.yellow, bg = "NONE" }, -- Code blocks
    ["@markup.strong"] = { fg = colors.pink, bold = true }, -- Bold
    ["@markup.italic"] = { fg = colors.white, italic = true }, -- Italic
    ["@markup.link.url"] = { fg = colors.blue, underline = true },
  },
  devdocs = {
    ["@spell"] = { fg = colors.white },
  },
}

-- Link typescriptreact and javascriptreact to their base languages for TSX/JSX
language_overrides.typescriptreact = language_overrides.typescript
language_overrides.javascriptreact = language_overrides.javascript

-- Main Color
local function apply_colors()
  -- Always apply default highlights first
  apply_default_highlights()

  -- Only apply language overrides if we have a valid buffer with a filetype
  if vim.bo.filetype ~= "" then
    local ft = vim.bo.filetype
    if language_overrides[ft] then
      for group, settings in pairs(language_overrides[ft]) do
        hi(group, settings)
      end
    end
  end
end

-- Autocommand to Trigger Recalculation
local color_augroup = vim.api.nvim_create_augroup("DynamicColorscheme", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  group = color_augroup,
  pattern = "*",
  callback = apply_colors,
})

for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
  local hl = vim.api.nvim_get_hl(0, { name = group })
  if hl.bg then
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end
end

apply_colors()
vim.g.colors_name = "cottoncandy"
