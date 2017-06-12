if has("win32") || has("win64")
    source ~/_vimrc
else
    source ~/.vimrc
endif

colorscheme base16-default-dark

" Fast reload the .vimrc
map <silent> <leader>ss :source $MYGVIMRC<cr>
" Fast editing of .vimrc
map <silent> <leader>ee :e $MYGVIMRC<cr>

"when gvimrc is writed, reload it
if has('autocmd')
    autocmd! bufwritepost $MYGVIMRC source $MYGVIMRC
endif
