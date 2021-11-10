
vim.g['tagbar_autoclose']=1
vim.g['tagbar_autofocus']=1
-- Short-key for flip tags list open/close, not useful when using winmanager
vim.cmd('au FileType c,cpp,python,go,rust map <silent> <F9> :TagbarToggle<CR>')


