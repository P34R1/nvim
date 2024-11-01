if vim.fn.executable("rust-analyzer") ~= 1 then
  return
end

local root_files = {
  'Cargo.toml',
  '.git',
  '.gitignore',
}

local on_attach = function(client, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end

vim.lsp.start {
  name = 'rust_analyzer',
  cmd = { "rust-analyzer" },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    },
  },
}
