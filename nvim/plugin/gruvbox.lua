if vim.g.did_load_gruvbox_plugin then
  return
end
vim.g.did_load_gruvbox_plugin = true

-- Highlights unique characters for f/F and t/T motions
require('gruvbox').setup {
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
}

vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")

