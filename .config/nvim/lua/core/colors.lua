local M = {}

local hl = vim.api.nvim_set_hl

function M.colors(name)
  local ret = {
    vim.cmd("colorscheme " .. name),
    hl(0, "IndentBlankLineChar", { fg = "#484a4a" }),
    hl(0, "IndentBlankLineContextChar", { fg = "#909495" }),
    hl(0, "FidgetTask", { fg = "#5f6f67" }),
    hl(
      0,
      "NvimTreeOpenedFile",
      { fg = M.args[name].opened_fg, italic = M.args[name].opened_italic, bold = M.args[name].opened_bold }
    ),
    hl(
      0,
      "NvimTreeCursorLine",
      { fg = M.args[name].cursor_fg, italic = M.args[name].cursor_italic, bold = M.args[name].cursor_bold }
    ),
  }
  return ret
end

M.args = {
  ["catppuccin-mocha"] = {
    opened_fg = "#8beb63",
    opened_italic = true,
    opened_bold = false,
    cursor_fg = "#ffb732",
    cursor_italic = false,
    cursor_bold = true,
  },
  ["rose-pine"] = {
    opened_fg = "#8beb63",
    opened_italic = true,
    opened_bold = false,
    cursor_fg = "#ffb732",
    cursor_italic = false,
    cursor_bold = true,
  },
  ["everforest"] = {
    opened_fg = "#a7d933",
    opened_italic = true,
    opened_bold = false,
    cursor_fg = "#a7c080",
    cursor_italic = false,
    cursor_bold = true,
  },
  ["gruxbox_material"] = {
    opened_fg = "#a7d933",
    opened_italic = true,
    opened_bold = false,
    cursor_fg = "#a7c080",
    cursor_italic = false,
    cursor_bold = true,
  },
  ["nord"] = {
    opened_fg = "#a7d933",
    opened_italic = true,
    opened_bold = false,
    cursor_fg = "#a7c080",
    cursor_italic = false,
    cursor_bold = true,
  },
}

return M
