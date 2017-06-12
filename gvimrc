if has("win32") || has("win64")
    source ~/_vimrc
else
    source ~/.vimrc
endif

set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=m
if has("win32") || has("win64")
    set gfn=Consolas:h10
elseif has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Linux"
        set gfn=Monospace:h10
    endif
else
    set gfn=Monaco:h12
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
