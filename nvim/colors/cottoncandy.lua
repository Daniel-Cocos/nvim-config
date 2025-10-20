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
  pink1 = "#de4d86",
  cyan1 = "#70e4ef",
  cyan2 = "#84e6f8",
  blue1 = "#00509d",
  pink2 = "#ff36ab",
  pink3 = "#ff6Bab",
  yellow1 = "#f5bd1f",
  purple1 = "#820263",
  orange1 = "#fb8b24",
  orange2 = "#ff8000",
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
  softPurple1 = "#176E8E",
  deepLilac = "#8972C6",
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

  peachRed = "#E13C6B",
  mintGreen = "#6EBB82",
  waveRed = "#DD5555",
  springBlue = "#549CB4",
  sageGreen = "#87A96B",
  springLilac = "#9E9BC6",
  goldenYellow = "#E5B567",
  deepIndigo = "#6B5B95",
  salmonOrange = "#EC8B5E",
  warmGray = "#9B8B7E",
  mossGreen = "#82B894",
  goldenrod = "#D9B277",
  aqua = "#66B3B3",
  deepNavy = "#212629",
  porcelain = "#D4D9DC",
  slateComment = "#5C666A",
}

-- =============================================================================
-- Highlight Function
-- =============================================================================
local function hi(group, opts)
  if opts.bg == true then
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
  hi("ColorColumn", { bg = colors.sumiInk2 })
  hi("CursorColumn", { bg = "NONE" })
  hi("CursorLine", { bg = "NONE" })
  hi("CursorLineNr", { fg = colors.white, bg = "None", bold = true })
  hi("LineNr", { fg = colors.silverGray, bg = true })
  hi("Normal", { fg = colors.fujiWhite, bg = true })
  hi("NormalFloat", { fg = colors.faddedIndigo, bg = "NONE" })
  hi("SignColumn", { bg = true })
  hi("VertSplit", { fg = colors.sumiInk2, bg = true })
  hi("Visual", { bg = colors.charcoalMist })

  -- Command Line
  hi("CmdlinePrompt", { fg = colors.white })
  hi("CmdlineCmd", { fg = colors.white })
  hi("CmdlineKey", { fg = colors.white })

  -- Popup and Completion Menu
  hi("Pmenu", { fg = colors.fujiWhite, bg = "NONE" })
  hi("PmenuSel", { fg = colors.white, bg = "NONE", bold = true })
  hi("PmenuSbar", { bg = "NONE" })
  hi("PmenuThumb", { bg = "NONE" })

  -- Search and Match
  hi("Search", { fg = colors.fujiWhite, bg = colors.waveBlue2 })
  hi("IncSearch", { fg = colors.sumiInk1, bg = colors.waveBlue2 })
  hi("MatchParen", { fg = colors.springViolet1, bg = colors.sumiInk2, bold = true })

  -- Tabs
  hi("TabLineSel", { fg = colors.white, bg = "NONE", bold = true })
  hi("TabLine", { fg = colors.fujiWhite, bg = "NONE" })
  hi("TabLineFill", { bg = "NONE" })

  -- LSP Diagnostics
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

  -- Git Signs
  hi("GitSignsAdd", { fg = colors.gitAdd, bg = true })
  hi("GitSignsChange", { fg = colors.gitChange, bg = true })
  hi("GitSignsDelete", { fg = colors.gitDelete, bg = true })

  -- Tree-sitter Syntax (Default)
  hi("@variable", { fg = colors.springBlue })
  hi("@variable.builtin", { fg = colors.peachRed, bold = true })
  hi("@parameter", { fg = colors.dragonBlue })
  hi("@field", { fg = colors.crystalPink })
  hi("@property", { fg = colors.springBlue })
  hi("@constant", { fg = colors.coralBlush }) -- TEMP
  hi("@constant.builtin", { fg = colors.coralBlush, bold = true })
  hi("@function", { fg = colors.hazardOrange })
  --hi("@function.builtin", { fg = colors.peachRed, bold = true })
  --hi("@function.method", { fg = colors.softPurple })
  --hi("@function.method.call", { fg = colors.softPurple, bold = true })
  hi("@constructor", { fg = colors.softPurple })
  hi("@type", { fg = colors.pink3 })
  hi("@type.builtin", { fg = colors.pink3, bold = true })
  hi("@attribute", { fg = colors.hazardOrange })
  hi("@keyword", { fg = colors.samuraiRed, bold = true })
  --hi("@keyword.import", { fg = colors.peachRed, bold = true })
  --hi("@keyword.return", { fg = colors.peachRed, bold = true })
  -- hi("@keyword.function", { fg = colors.weepLilac, bold = true })
  --hi("@keyword.modifier", { fg = colors.springViolet1 })
  --hi("@keyword.class", { fg = colors.rosewoodMist })
  hi("@operator", { fg = colors.salmonOrange, bold = true })
  hi("@punctuation", { fg = colors.silverGray })
  hi("@string", { fg = colors.seafoamGreen })
  hi("@character", { fg = colors.seafoamGreen })
  hi("@string.escape", { fg = colors.seafoamGreen })
  hi("@number", { fg = colors.pink2, bold = true })
  hi("@number.float", { fg = colors.pink2, bold = true })
  hi("@boolean", { fg = colors.peachRed, bold = true })
  hi("@comment", { fg = colors.faddedIndigo, italic = true })
  hi("@spell", { fg = colors.faddedIndigo, italic = true })
  hi("@tag", { fg = colors.crystalPink })
  --hi("@tag.attribute", { fg = colors.springLilac })
  --hi("@tag.builtin", { fg = colors.crystalPink })
  --hi("@tag.delimiter", { fg = colors.faddedIndigo })
  --hi("@markup.heading", { fg = colors.dragonBlue })
  --hi("@markup.raw.block", { fg = colors.seafoamGreen, bg = "None", bold = true })
  hi("@module", { fg = colors.crystalPink, bg = "None" })

  -- Other Plugins
  -- CMP, Noice, LuaLine, Telescope
  hi("FloatBorder", { fg = colors.ivoryMist, bg = true })
  hi("CmpCursorLine", { fg = colors.white, bg = "NONE", bold = true })
  hi("CmpItemAbbr", { fg = colors.springBlue })
  hi("CmpItemAbbrMatch", { fg = colors.ivoryMist, bold = true })
  hi("CmpItemMenu", { fg = colors.silverGray })
  hi("CmpItemKindFunction", { fg = colors.dustyPetal })
  hi("CmpItemKindMethod", { fg = colors.dustyPetal })
  hi("CmpItemKindField", { fg = colors.crystalPink })
  hi("CmpItemKindFile", { fg = colors.fujiWhite })
  hi("CmpItemKindFolder", { fg = colors.dragonBlue })
  hi("CmpItemKindKeyword", { fg = colors.softPurple })
  hi("CmpItemKindVariable", { fg = colors.blushVeil })
  hi("CmpItemKindValue", { fg = colors.peachRed })
  hi("CmpItemKindColor", { fg = colors.fujiWhite })
  hi("CmpItemKindConstant", { fg = colors.springLilac })
  hi("CmpItemKindConstructor", { fg = colors.rosewoodMist })
  hi("CmpItemKindClass", { fg = colors.rosewoodMist })
  hi("CmpItemKindEnum", { fg = colors.deepLilac })
  hi("CmpItemKindEnumMember", { fg = colors.deepLilac })
  hi("CmpItemKindText", { fg = colors.fujiWhite })
  hi("CmpItemKindSnippet", { fg = colors.seafoamGreen })
  hi("CmpItemKindStruct", { fg = colors.deepLilac })
  hi("CmpItemKindInterface", { fg = colors.deepLilac })
  hi("CmpItemKindModule", { fg = colors.softPurple })
  hi("CmpItemKindProperty", { fg = colors.springBlue })
  hi("CmpItemKindReference", { fg = colors.fujiWhite })

  hi("StatusLine", { fg = colors.ivoryMist, bg = "NONE" })
  hi("StatusLineNC", { fg = colors.silverGray, bg = "NONE" })

  hi("TelescopeSelection", { bg = "NONE", bold = true })
  hi("TelescopeMatching", { fg = colors.hazardOrange, bold = true })
  hi("TelescopeNormal", { fg = colors.fujiWhite, bg = "NONE" })
  hi("TelescopeBorder", { fg = colors.white, bg = "NONE" })

  hi("NotifyBackground", { bg = colors.white })
end

-- =============================================================================
-- Language-Specific Overrides
-- =============================================================================
local language_overrides = {
  --c = {
    --["@keyword.import"] = { fg = colors.samuraiRed }, -- #include, #define
    --["@type.builtin"] = { fg = colors.springBlue, bold = true }, -- int, char, void
    --["@constant.builtin"] = { fg = colors.peachRed }, -- NULL, TRUE, FALSE
    --["@operator"] = { fg = colors.waveRed }, -- *, ->, &
  --},
  --cpp = {
    --["@keyword.import"] = { fg = colors.samuraiRed }, -- #include, #define
    --["@type.builtin"] = { fg = colors.springBlue, bold = true }, -- int, char, void
    --["@constructor"] = { fg = colors.dustyPetal, italic = true }, -- Class constructors
    --["@keyword.class"] = { fg = colors.deepLilac }, -- class, struct
    --["@variable.builtin"] = { fg = colors.peachRed, italic = true }, -- this
  --},
  -- CSS: Differentiate properties, selectors, and values
  --css = {
    --["@tag"] = { fg = colors.dragonBlue, bold = true }, -- Tag selectors (div, p)
    --["@property"] = { fg = colors.blushVeil }, -- color, font-size
    --["@constant"] = { fg = colors.crystalPink }, -- IDs (#main)
    --["@variable"] = { fg = colors.coralBlush }, -- Classes (.container)
    --["@constant.builtin"] = { fg = colors.peachRed }, -- Units (px, em, rem)
    --["@string"] = { fg = colors.seafoamGreen }, -- "string values"
  --},
  -- HTML: Tags and attributes
  --html = {
    --["@tag"] = { fg = colors.coralBlush },
    --["@tag.attribute"] = { fg = colors.springBlue, italic = true },
    --["@tag.delimiter"] = { fg = colors.faddedIndigo },
  --},
  -- Lua: Keywords and table-related syntax
  --lua = {
    --["@keyword.function"] = { fg = colors.softPurple, bold = true },
    --["@keyword"] = { fg = colors.springViolet1 }, -- local, if, for, end
    --["@variable.builtin"] = { fg = colors.peachRed, italic = true }, -- self
    --["@function"] = { fg = colors.springBlue },
    --["@punctuation"] = { fg = colors.fujiWhite }, -- Brackets for tables
  --},
  -- Python: Keywords, decorators, and self
  python = {
    --["@keyword"] = { fg = colors.deepLilac, bold = true }, -- def, class, if
    --["@attribute"] = { fg = colors.hazardOrange, italic = true }, -- @decorators
    --["@variable.builtin"] = { fg = colors.peachRed, italic = true }, -- self
    --["@type"] = { fg = colors.springBlue },
    --["@function"] = { fg = colors.coralBlush },
    ["@function.builtin"] = { fg = colors.peachRed, bold = true },
  },
  -- SQL: Make keywords stand out
  --sql = {
    --["@keyword"] = { fg = colors.dragonBlue, bold = true }, -- SELECT, FROM, WHERE
    --["@function"] = { fg = colors.springLilac }, -- COUNT(), MAX()
    --["@variable"] = { fg = colors.fujiWhite }, -- table_names, column_names
    --["@operator"] = { fg = colors.waveRed, bold = false },
  --},
  markdown = {
    ["@spell"] = { fg = colors.white },
    ["@markup.heading"] = { fg = colors.white, bold = true },
    ["@markup.raw.block"] = { fg = colors.seafoamGreen, bg = "NONE" }, -- Code blocks
    ["@markup.strong"] = { fg = colors.peachRed, bold = true }, -- Bold
    ["@markup.italic"] = { fg = colors.white, italic = true }, -- Italic
    ["@markup.link.url"] = { fg = colors.springBlue, underline = true },
  },
  --java = {
    --["@keyword.modifier"] = { fg = colors.samuraiRed }, -- public, static, final
    --["@type"] = { fg = colors.rosewoodMist, bold = true }, -- Class names
    --["@attribute"] = { fg = colors.hazardOrange, italic = true }, -- @Annotations
    --["@variable.builtin"] = { fg = colors.peachRed, italic = true }, -- this, super
    --["@type.builtin"] = { fg = colors.peachRed, bold = true }, -- int, boolean
  --},
  --javascript = {
    --["@keyword"] = { fg = colors.deepLilac, bold = true }, -- const, let, function
    --["@variable.builtin"] = { fg = colors.peachRed, italic = true }, -- this, document, window
    --["@property"] = { fg = colors.springBlue }, -- Object properties
    --["@tag"] = { fg = colors.coralBlush }, -- For JSX
    --["@tag.attribute"] = { fg = colors.springBlue, italic = true }, -- For JSX
  --},
  --typescript = {
    --["@keyword"] = { fg = colors.deepLilac, bold = true }, -- const, let, function
    --["@variable.builtin"] = { fg = colors.peachRed, italic = true }, -- this
    --["@property"] = { fg = colors.springBlue }, -- Object properties
    --["@type"] = { fg = colors.springLilac, italic = true }, -- type, interface definitions
    --["@tag"] = { fg = colors.coralBlush }, -- For TSX
    --["@tag.attribute"] = { fg = colors.springBlue, italic = true }, -- For TSX
  --},
}
-- Link typescriptreact and javascriptreact to their base languages for TSX/JSX
language_overrides.typescriptreact = language_overrides.typescript
language_overrides.javascriptreact = language_overrides.javascript

-- Main Color
local function apply_colors()
  if vim.bo.buftype ~= "" or vim.bo.filetype == "" then
    return
  end

  apply_default_highlights()

  local ft = vim.bo.filetype

  if language_overrides[ft] then
    for group, settings in pairs(language_overrides[ft]) do
      hi(group, settings)
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

apply_colors()
vim.g.colors_name = "cottoncandy"
