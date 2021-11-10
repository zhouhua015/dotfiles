local map = vim.api.nvim_set_keymap

-- Add goto for c/cpp files
vim.cmd('autocmd filetype c,cpp,rust nnoremap <buffer> <silent> gd :YcmCompleter GoTo<CR>')
vim.cmd('autocmd filetype rust nnoremap <buffer> <leader>cfs :ycmcompleter gotoreferences<cr>')
vim.cmd('autocmd filetype c,cpp,rust nnoremap <buffer> <leader>e :YcmCompleter RefactorRename ')

-- Unlimit the number of diags
vim.g.ycm_max_diagnostics_to_display = 0

-- FIXME after figure out how to set the property in lua for Ycm
-- use rust-analyzer for rust lsp
vim.cmd([[
let g:ycm_language_server =
\ [
\   {
\     'name': 'rust',
\     'cmdline': ['rust-analyzer'],
\     'filetypes': ['rust'],
\     'project_root_files': ['Cargo.toml']
\   }
\ ]
]])

vim.g.ycm_auto_hover = ''
map('n', '<leader>D', ':YcmShowDetailedDiagnostic<CR>', {})
map('n', '<leader>d', ':YcmCompleter GetType<CR>', {})

-- Let clangd fully control code completion
vim.g.ycm_clangd_uses_ycmd_caching = 0
