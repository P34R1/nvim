if vim.fn.executable('clangd') ~= 1 then
  return
end

local root_files = {
  'compile_commands.json',
  'compile_flags.txt',
  '.clangd',
  '.clang-format',
  '.clang-tidy',
  '.git',
}

vim.lsp.start({
  name = 'clangd',
  cmd = {
    'clangd',
    '--background-index',          -- Index project in the background
    '--clang-tidy',                -- Enable clang-tidy diagnostics
    '--header-insertion=iwyu',     -- Insert headers when needed (Include What You Use)
    '--completion-style=detailed', -- Provide more info in completion
    '--function-arg-placeholders', -- Add placeholders for function arguments
    '--fallback-style=llvm',       -- Style to use if .clang-format is missing
  },

  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
})
