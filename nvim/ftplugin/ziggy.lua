if vim.fn.executable("ziggy") ~= 1 then
  return
end

local root_files = {
  '.git',
  'build.zig',
  '.gitignore',
}

vim.lsp.start {
  name = 'ziggy lsp',
  cmd = { "ziggy", "lsp" },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    ziggy = {
      -- analyses = {
      --   unusedparams = true,
      -- },
      -- staticcheck = true,
      -- gofumpt = true,
    },
  },
}
