require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "cmake", "clang",   }

-- Configurarción para Clangd
vim.lsp.config.clangd = {
  cmd = {
    'clangd',
    '--clang-tidy',
    '--background-index',
    '--offset-encoding=utf-8',
  },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
}

vim.lsp.enable('clangd')

vim.lsp.enable({'luals', 'pyright'})
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
