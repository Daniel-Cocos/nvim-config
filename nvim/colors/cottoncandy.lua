-- Enable true color support
vim.o.termguicolors = true
vim.o.background = "dark"

-- Clear any existing highlights and reset syntax
vim.cmd([[hi clear]])
if vim.fn.exists("syntax_on") then
  vim.cmd([[syntax reset]])
end

-- All colors used
local colors = {
  coralBlush = "#D98982",
  black = "#000000",
  blushVeil = "#EC9EAD",
  dustyPetal = "#D59CA4",
  fujiWhite = "#D0D0D0",
  ivoryMist = "#F8F8F0",
  white = "#FFFFFF",
  silverGray = "#808080",
  sumiInk1 = "#1F1F28",
  sumiInk2 = "#2A2A37",
  waveBlue1 = "#543212",
  waveBlue2 = "#2D4F67",
  samuraiRed = "#E82424",
  dragonBlue = "#658594",
  springViolet1 = "#938AA9",
  crystalPink = "#A86E87",
  springBlue = "#549CB4",
  springLilac = "#9E9BC6",
  softPurple1 = "#176E8E",
  deepLilac = "#8972C6",
  waveRed = "#FF7777",
  peachRed = "#E13C6B",
  gitAdd = "#98BE65",
  gitChange = "#51AFEF",
  gitDelete = "#FF6C6B",
  seafoamGreen = "#6EA88F",
  softPurple = "#A86E87",
  hazardOrange = "#FF9E3B",
  mutedTeal = "#3BA7A4",
  faddedIndigo = "#4C5C68",
  rosewoodMist = "#B36A68",
  charcoalMist = "#2e2e2e",
}

vim.api.nvim_set_hl(0, "NotifyBackground", { bg = colors.white })

-- Set highlight groups (bg=true => "NONE")
local function hi(group, opts)
  if opts.bg == true then
    opts.bg = "NONE"
  end
  vim.api.nvim_set_hl(0, group, opts)
end

-- =============================================================================
-- UI Core
-- =============================================================================
hi("DiffText", { bg = "NONE" })
hi("DiffAdd", { bg = "NONE" })
hi("DiffChange", { bg = "NONE" })
hi("DiffDelete", { bg = "NONE" })
hi("DiffDelete", { bg = "NONE" })
hi("ColorColumn", { bg = colors.sumiInk2 })
hi("CursorColumn", { bg = "NONE" })
hi("CursorLine", { bg = "None" })
hi("CursorLineNr", { fg = colors.white, bg = "None", bold = true })
hi("LineNr", { fg = colors.fujiWhite, bg = true })
hi("Normal", { fg = colors.fujiWhite, bg = true })
hi("NormalFloat", { fg = colors.faddedIndigo, bg = true })
hi("SignColumn", { bg = true })
hi("VertSplit", { fg = colors.fujiWhite, bg = true })
hi("Visual", { bg = colors.charcoalMist })

-- Visual Modes Backgorund
-- =============================================================================
-- Command Line Core
-- =============================================================================
hi("CmdlinePrompt", { fg = colors.white })
hi("CmdlineCmd", { fg = colors.white })
hi("CmdlineKey", { fg = colors.white })

-- =============================================================================
-- Popup and Completion Menu
-- =============================================================================
hi("Pmenu", { fg = colors.fujiWhite, bg = "NONE" })
hi("PmenuSel", { fg = colors.white, bg = "NONE", bold = true })
hi("PmenuSbar", { bg = colors.waveBlue1 })
hi("PmenuThumb", { bg = colors.waveBlue2 })

-- =============================================================================
-- Search and Match
-- =============================================================================
hi("Search", { fg = colors.fujiWhite, bg = colors.waveBlue2 })
hi("IncSearch", { fg = colors.sumiInk1, bg = colors.waveBlue2 })
hi("MatchParen", { fg = colors.springViolet1, bg = colors.sumiInk2 })

-- =============================================================================
-- Tabs
-- =============================================================================
hi("TabLineSel", { fg = colors.white, bg = "NONE", bold = true }) -- Active tab
hi("TabLine", { fg = colors.fujiWhite, bg = "NONE" }) -- Inactive tab
hi("TabLineFill", { fg = "NONE", bg = "NONE" }) -- Filler space

-- =============================================================================
-- LSP Diagnostics
-- =============================================================================
hi("DiagnosticError", { fg = colors.samuraiRed })
hi("DiagnosticWarn", { fg = colors.hazardOrange })
hi("DiagnosticInfo", { fg = colors.mutedTeal })
hi("DiagnosticHint", { fg = colors.dragonBlue })
hi("DiagnosticVirtualTextError", { fg = colors.samuraiRed, bg = true })
hi("DiagnosticVirtualTextWarn", { fg = colors.hazardOrange, bg = true })
hi("DiagnosticVirtualTextInfo", { fg = colors.mutedTeal, bg = true })
hi("DiagnosticVirtualTextHint", { fg = colors.dragonBlue, bg = true })
hi("DiagnosticUnderlineError", { sp = colors.samuraiRed, underline = true })
hi("DiagnosticUnderlineWarn", { sp = colors.hazardOrange, underline = true })
hi("DiagnosticUnderlineInfo", { sp = colors.mutedTeal, underline = true })
hi("DiagnosticUnderlineHint", { sp = colors.dragonBlue, underline = true })
hi("DiagnosticSignError", { fg = colors.samuraiRed })
hi("DiagnosticSignWarn", { fg = colors.hazardOrange })
hi("DiagnosticSignInfo", { fg = colors.mutedTeal })
hi("DiagnosticSignHint", { fg = colors.dragonBlue })

-- =============================================================================
-- Git Signs
-- =============================================================================
hi("GitSignsAdd", { fg = colors.gitAdd, bg = true })
hi("GitSignsChange", { fg = colors.gitChange, bg = true })
hi("GitSignsDelete", { fg = colors.gitDelete, bg = true })

-- =============================================================================
-- Tree-sitter Syntax
-- =============================================================================
-- Core roles
hi("@variable", { fg = colors.blushVeil })
hi("@variable.builtin", { fg = colors.blushVeil, bold = true })
hi("@parameter", { fg = colors.dragonBlue })
hi("@field", { fg = colors.crystalPink })
hi("@property", { fg = colors.springBlue })
hi("@constant", { fg = colors.springLilac, bold = true })
hi("@constant.builtin", { fg = colors.springLilac, bold = true })
hi("@function", { fg = colors.coralBlush })
hi("@function.builtin", { fg = colors.springLilac, bold = true })
hi("@function.method", { fg = colors.dustyPetal })
hi("@constructor", { fg = colors.rosewoodMist })
hi("@type", { fg = colors.deepLilac })
hi("@type.builtin", { fg = colors.softPurple, bold = true })
hi("@attribute", { fg = colors.hazardOrange })
hi("@keyword", { fg = colors.softPurple, bold = true })
hi("@keyword.import", { fg = colors.softPurple, bold = true })
hi("@keyword.function", { fg = colors.springLilac })
hi("@keyword.modifier", { fg = colors.springViolet1 })
hi("@keyword.class", { fg = colors.rosewoodMist })
hi("@operator", { fg = colors.waveRed, bold = true })
hi("@punctuation", { fg = colors.faddedIndigo })
hi("@string", { fg = colors.seafoamGreen })
hi("@string.escape", { fg = colors.peachRed })
hi("@number", { fg = colors.springLilac })
hi("@boolean", { fg = colors.peachRed, bold = true })
hi("@comment", { fg = colors.faddedIndigo, italic = true })
hi("@spell", { fg = colors.faddedIndigo, italic = true })

-- HTML / XML tags
hi("@tag", { fg = colors.crystalPink })
hi("@tag.attribute", { fg = colors.springLilac })
hi("@tag.builtin", { fg = colors.crystalPink })
hi("@tag.delimiter", { fg = colors.faddedIndigo })

-- =============================================================================
-- Other Plugins
-- =============================================================================
-- CMP
hi("FloatBorder", { fg = colors.ivoryMist, bg = true }) -- CMP Border
hi("CmpCursorLine", { fg = colors.white, bg = "NONE", bold = true }) -- CMP Select
hi("CmpItemAbbr", { fg = colors.springBlue }) -- Unselected item text
hi("CmpItemAbbrMatch", { fg = colors.ivoryMist, bold = true }) -- Matching text
hi("CmpItemMenu", { fg = colors.dimGray }) -- Source label
hi("CmpItemKindFunction", { fg = colors.dustyPetal }) -- CMP Function
hi("CmpItemKindMethod", { fg = colors.dustyPetal }) -- CMP Method
hi("CmpItemKindField", { fg = colors.dustyPetal }) -- CMP Field
hi("CmpItemKindFile", { fg = colors.dustyPetal }) -- CMP File
hi("CmpItemKindFolder", { fg = colors.dustyPetal }) -- CMP File
hi("CmpItemKindKeyword", { fg = colors.dustyPetal }) -- CMP Keyword
hi("CmpItemKindVariable", { fg = colors.dustyPetal }) -- CMP Variable
hi("CmpItemKindValue", { fg = colors.dustyPetal }) -- CMP Variable
hi("CmpItemKindColor", { fg = colors.dustyPetal }) -- CMP Variable
hi("CmpItemKindConstant", { fg = colors.dustyPetal }) -- CMP Constant
hi("CmpItemKindConstructor", { fg = colors.dustyPetal }) -- CMP Constructor
hi("CmpItemKindClass", { fg = colors.dustyPetal }) -- CMP Class
hi("CmpItemKindEnum", { fg = colors.dustyPetal }) -- CMP Enum
hi("CmpItemKindEnumMember", { fg = colors.dustyPetal }) -- CMP EnumMember
hi("CmpItemKindText", { fg = colors.dustyPetal }) -- CMP Text
hi("CmpItemKindSnippet", { fg = colors.dustyPetal }) -- CMP Snippet
hi("CmpItemKindStruct", { fg = colors.dustyPetal }) -- CMP Struct
hi("CmpItemKindInterface", { fg = colors.dustyPetal }) -- CMP Interface
hi("CmpItemKindModule", { fg = colors.dustyPetal }) -- CMP Module
hi("CmpItemKindProperty", { fg = colors.dustyPetal }) -- CMP Property
hi("CmpItemKindReference", { fg = colors.dustyPetal }) -- CMP Reference

-- Noice
hi("NoiceCmdline", { fg = colors.white, bg = "NONE" }) -- Main text typed in the command line popup
hi("NoiceCmdlineIcon", { fg = colors.white, bg = "NONE" }) -- Icon or prompt prefix (e.g., ':')
hi("NoiceCmdlinePopup", { fg = colors.white, bg = "NONE" }) -- Floating popup window background for command line input
hi("NoiceCmdlinePopupBorder", { fg = colors.white, bg = "NONE" }) -- Border around the floating command line popup
hi("NoiceCmdlineHistory", { fg = colors.white, bg = "NONE" }) -- Entries in the command line history popup
hi("NoiceCmdlineHistorySearch", { fg = colors.white, bg = "NONE" }) -- Highlight for search matches in command line history
hi("NoicePopupmenu", { fg = colors.white, bg = "NONE" }) -- Completion popup menu text (unselected)
hi("NoicePopupmenuSel", { fg = colors.white, bg = "NONE" }) -- Selected completion item in popup menu
hi("NoicePopupmenuKind", { fg = colors.white, bg = "NONE" }) -- Kind icon or label in popup menu
hi("NoicePopupmenuKindDefault", { fg = colors.white, bg = "NONE" }) -- Default kind icon in popup menu
hi("NoicePopupmenuKindKeyword", { fg = colors.white, bg = "NONE" }) -- Keyword kind icon in popup menu
hi("NoicePopupmenuKindVariable", { fg = colors.white, bg = "NONE" }) -- Variable kind icon in popup menu
hi("NoicePopupmenuKindConstant", { fg = colors.white, bg = "NONE" }) -- Constant kind icon in popup menu
hi("NoicePopupmenuKindFunction", { fg = colors.white, bg = "NONE" }) -- Function kind icon in popup menu
hi("NoicePopupmenuKindMethod", { fg = colors.white, bg = "NONE" }) -- Method kind icon in popup menu
hi("NoicePopupmenuKindInterface", { fg = colors.white, bg = "NONE" }) -- Interface kind icon in popup menu
hi("NoicePopupmenuKindText", { fg = colors.white, bg = "NONE" }) -- Text kind icon in popup menu
hi("NoicePopupmenuKindSnippet", { fg = colors.white, bg = "NONE" }) -- Snippet kind icon in popup menu
hi("NoicePopupmenuKindColor", { fg = colors.white, bg = "NONE" }) -- Color kind icon in popup menu
hi("NoicePopupmenuKindFile", { fg = colors.white, bg = "NONE" }) -- File kind icon in popup menu
hi("NoicePopupmenuKindFolder", { fg = colors.white, bg = "NONE" }) -- Folder kind icon in popup menu
hi("NoicePopupmenuKindEnum", { fg = colors.white, bg = "NONE" }) -- Enum kind icon in popup menu
hi("NoicePopupmenuKindEnumMember", { fg = colors.white, bg = "NONE" }) -- Enum member kind icon in popup menu
hi("NoicePopupmenuKindStruct", { fg = colors.white, bg = "NONE" }) -- Struct kind icon in popup menu
hi("NoiceNotify", { fg = colors.white, bg = "NONE" }) -- Notification background and text
hi("NoiceNotifyBorder", { fg = colors.white, bg = "NONE" }) -- Border around notifications
hi("NoiceNotifyError", { fg = colors.white, bg = "NONE" }) -- Error notification highlight
hi("NoiceNotifyWarn", { fg = colors.white, bg = "NONE" }) -- Warning notification highlight
hi("NoiceNotifyInfo", { fg = colors.white, bg = "NONE" }) -- Info notification highlight
hi("NoiceNotifyDebug", { fg = colors.white, bg = "NONE" }) -- Debug notification highlight
hi("NoiceNotifyTrace", { fg = colors.white, bg = "NONE" }) -- Trace notification highlight
hi("NoiceLspProgressClient", { fg = colors.white, bg = "NONE" }) -- LSP progress client name
hi("NoiceLspProgressSpinner", { fg = colors.white, bg = "NONE" }) -- Spinner during LSP progress
hi("NoiceLspProgressTitle", { fg = colors.white, bg = "NONE" }) -- Title text in LSP progress
hi("NoiceLspProgressPercentage", { fg = colors.white, bg = "NONE" }) -- Percentage text in LSP progress
hi("NoiceLspProgressMessage", { fg = colors.white, bg = "NONE" }) -- Message text in LSP progress
hi("NoiceLspProgressExtra", { fg = colors.white, bg = "NONE" }) -- Extra info text in LSP progress
hi("NoiceFormatTitle", { fg = colors.white, bg = "NONE" }) -- Titles for formatted messages
hi("NoiceFormatContent", { fg = colors.white, bg = "NONE" }) -- Content for formatted messages
hi("NoiceFormatReason", { fg = colors.white, bg = "NONE" }) -- Reason for formatted messages
hi("NoiceFormatField", { fg = colors.white, bg = "NONE" }) -- Field names in formatted messages

-- LuaLine
hi("StatusLine", { fg = colors.ivoryMist, bg = "NONE" }) -- Main Lualine
hi("StatusLineNC", { fg = colors.ivoryMist, bg = "NONE" }) -- Second Lualine

-- Telescope
hi("TelescopeSelection", { fg = colors.ivoryMist, bg = "NONE", bold = true }) -- Telescope Select
hi("TelescopeMatching", { fg = colors.dragonBlue, bg = "NONE", bold = true }) -- Telescope Select
hi("TelescopeNormal", { fg = colors.fujiWhite, bg = "NONE" }) -- Telescope Unselected Options

vim.g.colors_name = "cottoncandy" -- Colorscheme Name

