set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

"" The following are examples of different formats supported.
"" Keep bundle commands between here and filetype plugin indent on.
"" scripts on GitHub repos
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'tpope/vim-rails.git'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"" scripts from http://vim-scripts.org/vim/scripts.html
" Bundle 'L9'
" Bundle 'FuzzyFinder'
"" scripts not on GitHub
" Bundle 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///home/gmarik/path/to/plugin'

Bundle 'bufexplorer.zip'
Bundle 'closetag.vim'
Bundle 'matchit.zip'
Bundle 'kien/ctrlp.vim'
Bundle 'mschinz/omnicppcomplete'
Bundle 'kevinw/pyflakes-vim'
Bundle 'garbas/vim-snipmate'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'altercation/vim-colors-solarized'
Bundle 'dgryski/vim-godef'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'sukima/xmledit'
Bundle 'tpope/vim-fugitive'
Bundle 'dgryski/vim-godef'
Bundle 'Blackrush/vim-gocode'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'mattn/emmet-vim'

Bundle 'zhouhua015/goref', {'rtp': 'vim/'}

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" Put your stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""
" ===>> General
"""""""""""""""""""""""""""""""""""""""""""""""""
"set how many lines of history VIM has to remember
set history=700

" Load indentation rules and plugins according to the detected filetype.
if has("autocmd")
    filetype plugin indent on
endif

set autoread " auto read file

let mapleader = ","
let g:mapleader = ","

" Fast reload the .vimrc
map <silent> <leader>ss :source $MYVIMRC<cr>
" Fast editing of .vimrc
map <silent> <leader>ee :e $MYVIMRC<cr>
" Fast saving
map <silent> <leader>w :w!<cr>
" Fast quiting, with make session to save current workspace
map <silent> <leader>q :mksession cursession<cr>:q<cr>

"when vimrc is writed, reload it
if has('autocmd')
    autocmd! bufwritepost $MYVIMRC source $MYVIMRC
endif

" fold settings, fold the same indent line
" 'zc', 'za', 'zo' change the fold
set foldmethod=indent
set foldlevel=99

"""""""""""""""""""""""""""""""""""""""""
"        VIM user interface
"""""""""""""""""""""""""""""""""""""""""
" set 7 lines to the cursors - when moving vertical
set so=7
set wildmenu
set wildignore=*.o,*~,*.pyc
set lazyredraw
set magic
set ruler "Always show current position

" Have cursor line only in current window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

set ttyfast     " Fast terminal connection
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set cmdheight=1 " The commandbar height

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching

set hlsearch        " Highlight search things
set incsearch		" Incremental search
set mat=2           " How many tenths of a second to blink

set autowrite		" Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set relativenumber  " Show relative line number, convenient for movement

set cinoptions=:s,g0,t0,(0,J1

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8

" Syntax highlighting by default.
"syntax on
syntax enable

set t_Co=256

" The following 2 settings' order will effect the color scheme
"colorscheme Tomorrow-Night-Eighties
"set background=dark
set background=dark
colorscheme solarized


if has("gui_running")
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set lines=75 columns=120
    "set lines=75
    if has("win32") || has("win64")
        set gfn=Lucida\ Console:h10
    else
        set gfn=Monaco:h12
    endif
endif

try
    lang en_US
catch
endtry


"""""""""""""""""""""""""""""""""""""""""
" Work with tmux
"""""""""""""""""""""""""""""""""""""""""
"au BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window " . expand("%:t"))


"""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""
" Turn backup off, using SVN or git, no local backup
set nobackup nowb noswapfile

" Persistent undo
"try
"    set undodir=~/.vim/undodir
"    set undofile
"catch
"endtry

" Jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""
set expandtab "expand tab as blank
set shiftwidth=4
set tabstop=4
set smarttab

set lbr "no new line before one word is finished
" Set auto indent, smart indent, wrap lines
set ai si wrap

set textwidth=80
set formatoptions=qrn1  " Actually, I don't know the exactly meaning of this
set colorcolumn=80      " Show a colored column at 80 characters 


""""""""""""""""""""""""""""""
" Visual mode related
""""""""""""""""""""""""""""""
" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :grep -o -R -P "" .<left><left><left>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("grep -o -R -P " . '"'. l:pattern . '"' . ' .')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines
" Problem with the relative number
"map j gj
"map k gk

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

"" Move line vertically, need the work around to work properly
"noremap <A-j> :m+<CR>
"noremap <A-k> :m-2<CR>
"inoremap <A-j> <Esc>:m+<CR>
"inoremap <A-k> <Esc>:m-2<CR>
"vnoremap <A-j> :m'>+<CR>gv
"vnoremap <A-k> :m-2<CR>gv
"
"" Work around 'no-meta-key-terminal' problem
"" see http://goo.gl/vbvDn for more details 
"let c='a'
"while c <= 'z'
"    exec "set <A-".c.">=\e".c
"    exec "imap \e".c." <A-".c.">"
"    let c = nr2char(1+char2nr(c))
"endw
"
"set timeout ttimeoutlen=50
"" END of workaround

" Resize splits when window resized
au VimResized * exe "normal! \<c-w>="


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Swap split window
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

" Fix the horribly default regex handling
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Make Y behave likt other capitals
map Y y$

" Close the current buffer without saving
map <leader>bd :Bclose<cr>

" Avoid the bloody far <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" Map the <Esc> to a nearer key under insert mode
inoremap <c-[> <Esc>

" Use the arrows switch among buffers
map <right> :bn<cr>
map <left> :bp<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete ".l:currentBufNum)
   endif
endfunction


"""""""""""""""""""""""""""""""""""""""""
" Statusline
"""""""""""""""""""""""""""""""""""""""""
" Always show the statusline
set laststatus=2

" Format the statusline, this is fantastic!
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y
set statusline+=%=%c,%l/%L\ %P

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/zhouhua', "~", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE'
    else
        return ''
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""
" Parenthesis/bracket expanding
"""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>0
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.inl :call DeleteTrailingWS()
autocmd BufWrite *.hpp :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""
" Quickfix
"""""""""""""""""""""""""""""""""""""""""
map <leader><space> :w<cr>:make<cr>
nmap <leader>cc :botright cope<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>ccl :ccl<cr>


"""""""""""""""""""""""""""""""""""""""""
" BufExplorer
"""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0      " Do not show default help
let g:bufExplorerShowRelativePath=1 " Show relative paths
let g:bufExplorerSortBy='name'      " Sort by the buffer's name.
map <leader>o :BufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""
" AutoComplete
"""""""""""""""""""""""""""""""""""""""""
inoremap <C-]>   <C-X><C-]>
inoremap <C-F>   <C-X><C-F>
inoremap <C-D>   <C-X><C-D>
inoremap <C-L>   <C-X><C-L>
inoremap <C-P>   <C-X><C-P>


"""""""""""""""""""""""""""""""""""""""""
" SuperTab
"""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType="context"


"""""""""""""""""""""""""""""""""""""""""
" OmniCppComplete
"""""""""""""""""""""""""""""""""""""""""
" Short-key for make tags for cpp file
set completeopt=longest,menu
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<cr>
set completeopt=longest,menu

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType python set omnifunc=pythoncomplete#Complete


""""""""""""""""""""""""""""""
" => Python section
" """"""""""""""""""""""""""""""
let python_highlight_all=1
au FileType python syn keyword pythonDecorator True None False self

if has("win32") || has("win64")
    au FileType python set tags+="C:\Python27\Lib\python_tags"
else
    au FileType python set tags+=/usr/lib/python2.7/python27tags
endif

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def


"""""""""""""""""""""""""""""""""""""""""
" pyflakes
"""""""""""""""""""""""""""""""""""""""""
let g:pyflakes_use_quickfix = 0

"""""""""""""""""""""""""""""""""""""""""
" Google appengine
"""""""""""""""""""""""""""""""""""""""""
if has("win32") || has("win64")
else
    au FileType python set tags+=/usr/lib/python2.7/gapptags
endif

"""""""""""""""""""""""""""""""""""""""""
" HTML section
"""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.html set filetype=htmldjango

"""""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
" Short-key for flip tags list open/close, not useful when using winmanager
map <silent> <F9> :TagbarToggle<cr>


""""""""""""""""""""""""""""""""""""""
" Ctrl-P settings
""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map='<c-p>'
let g:ctrlp_regexp = 1          " Use regexp search

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These 2 options are not used when g:ctrlp_user_command defined

"set wildignore+='*/.git/*,*/.hg/*,*/.svn/*'
"let g:ctrlp_custom_ignore='\.git$\|\.hg$\|\.svn$\|\.o$'
if !has("win32") && !has("win64")
let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
    \ 'fallback': 'find %s -type f ! -name "*.o" -a ! -name "*.a"'
    \ }
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OutlookVim setting
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32") || has("win64")
    let g:outlook_textwidth = 72
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope setting
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    if has("win32") || has("win64")
        set csprg=C:\Tools\cscope\cscope.exe
    endif
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs reset
        cs add cscope.out
    endif
    set csverb
endif

nmap <leader>cfs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cfg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cfc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cft :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cfe :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>cfi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>cfd :cs find d <C-R>=expand("<cword>")<CR><CR>


""""""""""""""""""""""""""""""""
" Arrow fixing
""""""""""""""""""""""""""""""""
nnoremap <Esc>A <up>
nnoremap <Esc>B <down>
nnoremap <Esc>C <right>
nnoremap <Esc>D <left>
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>


"""""""""""""""""""""""""""""""""""""""
" vimdiff color settings
"""""""""""""""""""""""""""""""""""""""
highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black


""""""""""""""""""""""""""""""""
" Local project settings
""""""""""""""""""""""""""""""""
if filereadable("local.vim")
    source local.vim
endif

""""""""""""""""""""""""""""""""
" Go tags settings
""""""""""""""""""""""""""""""""
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:godef_split = 0
"let g:godef_same_file_in_same_window = 1
let g:go_fmt_autofmt = 0
