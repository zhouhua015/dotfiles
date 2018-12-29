if has("win32") || has("win64")
    source ~/_vimrc
    set lines=75 columns=120
else
    source ~/.vimrc
endif

set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=m
if has("win32") || has("win64")
    set gfn=Consolas:h11
elseif has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Linux"
        set gfn=Monospace:h10
    else
        set gfn=Monaco:h11
    endif
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

if &diff
    set background=light
    colorscheme solarized
    let g:solarized_diffmode="high"
    set lines=75 columns=300
    set diffopt+=iwhite
endif
