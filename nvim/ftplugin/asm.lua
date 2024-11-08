if vim.fn.executable("asm-lsp") ~= 1 then
  return
end

local root_files = {
  '.asm-lsp.toml',
  -- 'build.fish',
  -- 'justfile',
  '.gitignore',
  '.git',
}

vim.lsp.start {
  name = 'asm-lsp',
  cmd = { "asm-lsp" },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    ['asm-lsp'] = {
      -- formatting = {
      --   command = { "nasmfmt" },
      -- },
    },
  },
}
