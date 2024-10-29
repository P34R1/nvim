if vim.fn.executable("gopls") ~= 1 then
  return
end

local root_files = {
  '.git',
  'go.mod',
  'go.sum',
  '.gitignore',
}

vim.lsp.start {
  name = 'gopls',
  cmd = { "gopls" },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}
