if vim.g.did_load_lualine_plugin then
  return
end
vim.g.did_load_lualine_plugin = true


require('lualine').setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = 'auto',
    section_separators = '',
    component_separators = ''
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  -- Example top tabline configuration (this may clash with other plugins)
  tabline = {
    lualine_a = { { 'tabs', mode = 1, }, },
    lualine_z = {
      {
        'buffers',
        show_filename_only = true,
        show_bufnr = true,
        mode = 4,
        filetype_names = {
          TelescopePrompt = 'Telescope',
          dashboard = 'Dashboard',
          fzf = 'FZF',
        },
        buffers_color = {
          -- Same values as the general color option can be used here.
          active = 'lualine_b_normal',     -- Color for active buffer.
          inactive = 'lualine_b_inactive', -- Color for inactive buffer.
        },
      },
    },
  },
  extensions = { 'fugitive', 'fzf', 'toggleterm', 'quickfix' },
}
