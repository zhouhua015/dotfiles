vim.cmd('autocmd FileType c,cpp nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>')
vim.cmd('autocmd FileType c,cpp vnoremap <buffer><leader>cf :ClangFormat<CR>')