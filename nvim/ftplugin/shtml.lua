if vim.fn.executable("superhtml") ~= 1 then
  return
end

local root_files = {
  '.git',
  'build.zig',
  '.gitignore',
}

vim.lsp.start {
  name = 'superhtml lsp',
  cmd = { "superhtml", "lsp" },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    superhtml = {
      -- analyses = {
      --   unusedparams = true,
      -- },
      -- staticcheck = true,
      -- gofumpt = true,
    },
  },
}
