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
    set gfn=Cascadia\ Mono:h10:cANSI:qDRAFT
    set lines=75 columns=120
elseif has("unix")
    let s:uname = substitute(system("uname -s"), '\n', '', 'g')
    if s:uname ==? "Linux"
        set gfn=Ubuntu\ Mono\ 13
        set lines=53 columns=130
    else
        set gfn=Menlo:h13
    endif
endif

colorscheme base16-default-light

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
