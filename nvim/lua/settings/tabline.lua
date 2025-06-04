local devicons = require("nvim-web-devicons")

-- Get buffer name
local function buf_name_or_untitled(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr)
  if name == nil or name == "" then
    return "[No Name]"
  else
    return vim.fn.fnamemodify(name, ":t") -- filename only
  end
end

-- Main function to generate a custom tabline
function _G.my_tabline()
  local s = ""
  local tabs = vim.api.nvim_list_tabpages() -- Get list of all tabs
  local current_tab = vim.api.nvim_get_current_tabpage() -- Identify current/active tab

  -- Iterate over all tab pages and set hl group based on tab
  for idx, tab in ipairs(tabs) do
    if tab == current_tab then
      s = s .. "%#TabLineSel#"
    else
      s = s .. "%#TabLine#"
    end

    -- Clicking switches tab
    s = s .. "%" .. idx .. "T"

    -- Get the first window in the tab
    local wins = vim.api.nvim_tabpage_list_wins(tab)
    local bufnr = vim.api.nvim_win_get_buf(wins[1])

    -- Get file name and extension of the buffer
    local fname = buf_name_or_untitled(bufnr)
    local ext = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":e")

    -- Get the file-type icon and its highlight group
    local icon, icon_hl = devicons.get_icon(fname, ext, { default = true })
    icon = icon or "" -- Default icon if none found
    icon_hl = icon_hl or "DevIconDefault" -- Default highlight group

    -- Apply icon highlight group and append the icon
    s = s .. "%#" .. icon_hl .. "#" .. icon

    -- Restore highlight group for tab text
    if tab == current_tab then
      s = s .. "%#TabLineSel#"
    else
      s = s .. "%#TabLine#"
    end

    -- Append the buffer file name
    s = s .. " " .. fname

    -- Add spacing between tabs
    s = s .. "  "
  end

  -- Fill the remaining tabline with default fill highlight
  s = s .. "%#TabLineFill#"

  return s
end
