local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    -- offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
    -- diagnostics = false | "nvim_lsp" | "coc",
    -- diagnostics_update_in_insert = false,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   return "("..count..")"
    -- end,
  },
  highlights = {
    --[[ fill = { ]]
    --[[   fg = "#ff0000", ]]
    --[[   bg = "TabLine", ]]
    --[[ }, ]]
    --[[ background = { ]]
    --[[   fg = "TabLine", ]]
    --[[   bg = "TabLine", ]]
    --[[ }, ]]
    --[[]]
    --[[ buffer_visible = { ]]
    --[[   fg = "TabLine", ]]
    --[[   bg = "TabLine", ]]
    --[[ }, ]]
    --[[]]
    --[[ close_button = { ]]
    --[[   fg = "TabLine", ]]
    --[[   bg = "TabLine", ]]
    --[[ }, ]]
    --[[ close_button_visible = { ]]
    --[[   fg = "TabLine", ]]
    --[[   bg = "TabLine", ]]
    --[[ }, ]]
    --[[]]
    --[[ tab_selected = { ]]
    --[[   fg = "Normal", ]]
    --[[   bg = "Normal", ]]
    --[[ }, ]]
    --[[ tab = { ]]
    --[[   fg = "TabLine", ]]
    --[[   bg = "TabLine", ]]
    --[[ }, ]]
    --[[ tab_close = { ]]
    --[[   fg = "TabLineSel", ]]
    --[[   bg = "Normal", ]]
    --[[ }, ]]
    --[[]]
    --[[ duplicate_selected = { ]]
    --[[   fg = "TabLineSel", ]]
    --[[   bg = "TabLineSel", ]]
    --[[   italic = true, ]]
    --[[ }, ]]
    --[[ duplicate_visible = { ]]
    --[[   fg = "TabLine", ]]
    --[[   bg = "TabLine", ]]
    --[[   italic = true, ]]
    --[[ }, ]]
    --[[ duplicate = { ]]
    --[[   fg = "TabLine", ]]
    --[[   bg = "TabLine", ]]
    --[[   italic = true, ]]
    --[[ }, ]]
    --[[]]
    --[[ modified = { ]]
    --[[   fg = "TabLine", ]]
    --[[   bg = "TabLine", ]]
    --[[ }, ]]
    --[[ modified_selected = { ]]
    --[[   fg = "Normal", ]]
    --[[   bg = "Normal", ]]
    --[[ }, ]]
    --[[ modified_visible = { ]]
    --[[   fg = "TabLine", ]]
    --[[   bg = "TabLine", ]]
    --[[ }, ]]
    --[[]]
    --[[ separator = { ]]
    --[[   fg = "TabLine", ]]
    --[[   bg = "TabLine", ]]
    --[[ }, ]]
    --[[ separator_selected = { ]]
    --[[   fg = { attribute = "bg", highlight = "Normal" }, ]]
    --[[   bg = { attribute = "bg", highlight = "Normal" }, ]]
    --[[ }, ]]
    --[[ indicator_selected = { ]]
    --[[   fg = "LspDiagnosticsDefaultHint", ]]
    --[[   bg = "Normal", ]]
    --[[ }, ]]
  },
}
