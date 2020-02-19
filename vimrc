set nocompatible              " be iMproved, required

" Use ale completion
let g:ale_completion_enabled = 1
let g:ale_sign_highlight_linenrs = 1

" set laststatus=2

if has("win32") || has("win64")
    let s:vim_dir = 'vimfiles'
else
    let s:vim_dir = '.vim'
endif

if empty(glob('~/' . s:vim_dir . '/autoload/plug.vim'))
  silent !curl -fLo '~/' .s:vim_dir '/autoload/plug.vim' --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/' . s:vim_dir . '/plugged')

Plug 'junegunn/vim-plug'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/matchit.zip'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'solarnz/thrift.vim', { 'for': 'thrift' }
Plug 'fatih/vim-go', { 'commit': 'b82f469b1d31e6e7468c62708caee196cb1b6b60', 'do': ':GoInstallBinaries' }
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --clang-completer --go-completer' }
Plug 'scrooloose/syntastic', { 'for': [ 'c', 'cpp', 'sh' ] }
Plug 'OmniSharp/Omnisharp-vim'
Plug 'tpope/vim-dispatch'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dense-analysis/ale', { 'for': [ 'typescript', 'go' ] }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'rhysd/vim-clang-format', { 'for': [ 'cpp', 'c' ] }
Plug 'jparise/vim-graphql'
" Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'tpope/vim-obsession'

call plug#end()

"""""""""" Beginning of Vundle.vim plugins configuration 
" filetype off                  " required
" " set the runtime path to include Vundle and initialize
" if has("win32") || has("win64")
"     set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
"     let path = '$USERPROFILE/vimfiles/bundle/'
"     call vundle#rc(path)
" else
"     set rtp+=$HOME/.vim/bundle/Vundle.vim/
"     let path = '$HOME/.vim/bundle/'
"     call vundle#rc(path)
" endif

" " let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'vim-scripts/bufexplorer.zip'
" Bundle 'vim-scrips/matchit.zip'
" Bundle 'kien/ctrlp.vim'
" Bundle 'ervandew/supertab'
" Bundle 'majutsushi/tagbar'
" Bundle 'altercation/vim-colors-solarized'
" Plugin 'chriskempson/base16-vim'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'tpope/vim-fugitive'
" Bundle 'tpope/vim-surround'
" Bundle 'mattn/emmet-vim'
" Bundle 'solarnz/thrift.vim'
" Bundle 'fatih/vim-go'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'scrooloose/syntastic'
" Plugin 'OmniSharp/Omnisharp-vim'
" Plugin 'tpope/vim-dispatch'
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
" 
" if has("win32") || has("win64")
"     Bundle 'vim-scripts/visual_studio.vim'
" endif
" 
" filetype plugin indent on     " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :BundleList          - list configured bundles
" " :BundleInstall(!)    - install (update) bundles
" " :BundleSearch(!) foo - search (or refresh cache first) for foo
" " :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
" "
" " see :h vundle for more details or wiki for FAQ
" " NOTE: comments after Bundle commands are not allowed.
" " Put your stuff after this line

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
map <silent> <leader>q :mksession<cr>:q<cr>

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
set wildignore=*.o,*.a,*.so,*.jar,*.tar.*,*~,*.pyc
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
set nonu
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

set t_Co=256

syntax enable

if !has("gui_running")
    set background=dark
    colorscheme base16-default-dark
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
set statusline+=%=%c,%l/%L\ %P\ %{ObsessionStatus()}

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


""""""""""""""""""""""""""""""
" => Python section
" """"""""""""""""""""""""""""""
let python_highlight_all=1
au FileType python syn keyword pythonDecorator True None False self

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
au FileType python setlocal sw=2 sts=2 et


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
au FileType c,cpp,python,go map <silent> <F9> :TagbarToggle<cr>


""""""""""""""""""""""""""""""""""""""
" Ctrl-P settings
""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map='<c-p>'
let g:ctrlp_regexp = 1          " Use regexp search

" These 2 options are not used when g:ctrlp_user_command defined
"set wildignore+='*/.git/*,*/.hg/*,*/.svn/*'
"let g:ctrlp_custom_ignore='\.git$\|\.hg$\|\.svn$\|\.o$'
if !has("win32") && !has("win64")
    let g:ctrlp_user_command = {
                \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': 'find %s -type f',
                \ 'ignore': 1
                \ }
else
    let g:ctrlp_user_command = {
                \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': 'dir %s /-n /b /s /a-d',
                \ 'ignore': 1
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
function! RefreshTags()
    cs kill 0
    if has('Win32')
        let cmd = "update_cscope.bat"
    else
        let cmd = "./update_cscope.sh " . getcwd()
    endif

    echo cmd
    echo system(cmd)
    if v:shell_error
        echohl ErrorMsg | echom 'Failed to run ' . cmd | echohl NONE
    endif

    if filereadable("cscope.out")
        cs add cscope.out
    endif
endfunction

map <F6> :wa<cr>:call RefreshTags()<cr>

if has("cscope")
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


""""""""""""""""""""""""""""""""
" golang settings 
""""""""""""""""""""""""""""""""
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>s <Plug>(go-implements)

au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>l <Plug>(go-lint)
au FileType go nmap <Leader>v <Plug>(go-vet)
au FileType go nmap <Leader>k <Plug>(go-errcheck)

" Ask gocode to give complete options for unimported packages
" let g:go_gocode_unimported_packages = 1

" Use gopls 
let g:go_def_mode='godef'
" let g:go_info_mode='gopls'

" Highlight
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

if has("win32") || has("win64")
    let g:go_gocode_socket_type = 'tcp'
endif

""""""""""""""""""""""""""""""""""""""
" ALE 
""""""""""""""""""""""""""""""""""""""

"
" go: allow error sign to be working
" typescript: get rid of default eslint, which cannot recognize class decorators
let g:ale_linters = { 
    \ 'go': ['golint', 'govet', 'golangci-lint'],
    \ 'typescript': ['tslint', 'tsserver', 'xo'],
\}

let g:ale_go_golangci_lint_options=''

"
" typescript: lint and prettier while saving
let g:ale_fixer = { 
    \ 'typescript': ['tslint', 'prettier'],
\}

""""""""""""""""""""""""""""""""""""""
" Omnisharp-vim setting
""""""""""""""""""""""""""""""""""""""
"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
" let g:OmniSharp_typeLookupInPreview = 1

"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

"Super tab settings - uncomment the next 4 lines
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menu
" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
" let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

" Use omnisharp-roslyn backend
" let g:OmniSharp_server_type = 'roslyn'
" If you are using the omnisharp-roslyn backend, use the following
" let g:syntastic_cs_checkers = ['code_checker']

augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    " autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    autocmd FileType cs "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
    
augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
" set cmdheight=2

" Contextual code actions (requires CtrlP or unite.vim)
au FileType cs nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
au FileType cs vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
au FileType cs nnoremap <leader>nm :OmniSharpRename<cr>
au FileType cs nnoremap <F2> :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
au FileType cs command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
au FileType cs nnoremap <leader>rl :OmniSharpReloadSolution<cr>
au FileType cs nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
au FileType cs nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
au FileType cs nnoremap <leader>css :OmniSharpStartServer<cr>
au FileType cs nnoremap <leader>csp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
au FileType cs nnoremap <leader>th :OmniSharpHighlightTypes<cr>

let g:OmniSharp_selector_ui = 'ctrlp'


""""""""""""""""""""""""""""""""""""""
" Ycm settings
""""""""""""""""""""""""""""""""""""""
" Add goto for c/cpp files
autocmd filetype c,cpp nnoremap <buffer> <silent> gd :YcmCompleter GoTo<CR>

autocmd filetype cs let g:ycm_autoclose_preview_window_after_completion=1

" Use python3 executable
" let g:ycm_python_binary_path = 'python3'
let g:ycm_server_python_interpreter = 'python3'
" let g:ycm_show_diagnostics_ui = 1
" Unlimit the number of diags
let g:ycm_max_diagnostics_to_display = 0

" let g:ycm_filetype_whitelist = {
"       \ 'c': 1,
"       \ 'cpp': 1,
"       \ 'objc': 1,
"       \ 'objcpp': 1,
"       \ 'cuda': 1,
"       \ 'cs': 1,
"       \ 'java': 1
"       \}

""""""""""""""""""""""""""""""""""""""
" ultisnips settings
""""""""""""""""""""""""""""""""""""""
" Trigger configuration
if has("gui_running")
    let g:UltiSnipsExpandTrigger="<c-enter>"
else
    " Since not all terminal emulators are sending Ctrl-Enter to running
    " program, use insert mode command map as workaround
    " inoremap <leader><cr> <C-R>=UltiSnips#ExpandSnippet()<CR>
    inoremap <leader><tab> <C-R>=UltiSnips#ExpandSnippet()<CR>
endif

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


""""""""""""""""""""""""""""""""""""""
" c/cpp settings
""""""""""""""""""""""""""""""""""""""
" Find corresponding header/source file
let g:src_suffix="cpp"
function! SwitchSourceHeader()
  let basename=expand("%:t:r")
  let to=basename . "." . g:src_suffix
  if  (expand ("%:e") == "c")   ||
    \ (expand ("%:e") == "cc") ||
    \ (expand ("%:e") == "cpp") ||
    \ (expand ("%:e") == "hxx") ||
    \ (expand ("%:e") == "hpp")
    let to=basename . '.h'
  endif

  exec 'find ' . to
endfunction

nmap ,s :call SwitchSourceHeader()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" json settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType json setlocal tabstop=2
au FileType json setlocal shiftwidth=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" web development settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType javascript,vue,html,scss,css,typescript setlocal ts=2 sw=2
au FileType vue syntax sync fromstart

autocmd FileType javascript,typescript nnoremap gd :ALEGoToDefinition<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Include path function for local.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! IncludePaths()
    let curdir = getcwd()
    for include in g:local_project_includes
        let curinclude=curdir . '/' . include
        exec 'set path+=' . curinclude
    endfor
endfunction

""""""""""""""""""""""""""""""""
" Local project settings
""""""""""""""""""""""""""""""""
if filereadable(".local.vim")
    source .local.vim
endif

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif


""""""""""""""""""""""""""""""""
" clang-format 
""""""""""""""""""""""""""""""""
autocmd FileType c,cpp nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><leader>cf :ClangFormat<CR>

""""""""""""""""""""""""""""""""
" shell checker
""""""""""""""""""""""""""""""""
let g:syntastic_sh_checkers = [ "shellcheck" ]

