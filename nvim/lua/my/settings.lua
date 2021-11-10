local o = vim.opt

-------------------
-- =====>> General
-------------------
-- How many lines of history VIM has to remember
o.history=700
o.updatetime=300
-- fold settings, fold the same indent line
-- 'zc', 'za', 'zo' change the fold
o.foldmethod='indent'
o.foldlevel=99

----------------------------------
-- =====>> VIM user interface
-- --------------------------------
-- 7 lines to the cursors - when moving vertical
o.scrolloff=7
o.wildignore=[[*.o,*.a,*.so,*.jar,*.tar.*,*~,*.pyc]]
o.lazyredraw=true

-- Have cursor line only in current window
vim.cmd([[autocmd WinLeave * set nocursorline]])
vim.cmd([[autocmd WinEnter * set cursorline]])

-- Show (partial) command in status line.
o.showcmd=true
-- Show matching brackets.
o.showmatch=true

-- allow backspace over 'eol', start of insert, auto-inserted indention
-- TODO figure out if this is necessary in neovim
-- o.backspace='eol,start,indent'

-- Do case insensitive matching
o.ignorecase=true
-- Do smart case matching
o.smartcase=true
-- Incremental search
o.incsearch=true
-- Automatically save before commands like :next and :make
o.autowrite=true
-- Show relative line number, convenient for movement
o.number=false
o.relativenumber=true

-- Wait 500ms for a mapped sequence to complete
o.timeoutlen=500

o.encoding='utf8'
-- Enable syntax highlight
vim.cmd('syntax enable')

-- Enable mouse support
o.mouse='a'

---------------------------------------
-- =====>> Files, backups and undo
---------------------------------------
-- Turn backup off, using SVN or git, no local backup
o.backup=false
o.swapfile=false

-- Jump to the last position when reopening a file
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

------------------------------------------
-- =====>> Text, tab and indent related
------------------------------------------
--Expand tab as blank
o.expandtab=true
o.shiftwidth=4
o.tabstop=4

-- no new line before one word is finished
o.linebreak=true
-- Enable smart indent
o.smartindent=true
-- Wrap lines
o.wrap=true
o.whichwrap:append '<,>,h,l'
o.cinoptions=':s,g0,t0,(0,J1'
-- enable indentation
o.breakindent=true
-- ident by an additional 2 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
o.breakindentopt={shift=2,min=40,sbr=true}
-- append '>>' to indent
o.showbreak='>>'

o.textwidth=100
-- TODO Legacy setting from vim, don't know the exactly meaning
o.formatoptions:append 'qrn1'
-- Show a colored column at 100 characters
o.colorcolumn='100'

----------------------------------------
-- =====>> Statusline
----------------------------------------
-- Always show the statusline
o.laststatus=2

-- Format the statusline, this is fantastic!
o.statusline='%t[%{strlen(&fenc)?&fenc:\'none\'},%{&ff}]%h%m%r%y'
o.statusline:append '%=%c,%l/%L %P'

-- Remove trailing white space
vim.cmd('autocmd BufWrite *.py :call DeleteTrailingWS()')
vim.cmd('autocmd BufWrite *.c :call DeleteTrailingWS()')
vim.cmd('autocmd BufWrite *.cpp :call DeleteTrailingWS()')
vim.cmd('autocmd BufWrite *.h :call DeleteTrailingWS()')
vim.cmd('autocmd BufWrite *.inl :call DeleteTrailingWS()')
vim.cmd('autocmd BufWrite *.hpp :call DeleteTrailingWS()')

-- cscope
if vim.fn.has('cscope') then
    o.csto = 1
    o.cst = true
    o.cst = true
    o.csverb = false
    if vim.fn.filereadable('cscope.out') == 1 then
        vim.cmd([[
            cs reset
            cs add cscope.out
        ]])
    end
    o.csverb = true
end

-- json
vim.cmd('au FileType json setlocal tabstop=2')
vim.cmd('au FileType json setlocal shiftwidth=2')
vim.cmd('au FileType json syntax match Comment +\\/\\/.\\+$+')

-- python
vim.cmd('au FileType python syn keyword pythonDecorator True None False self')
vim.cmd('au BufNewFile,BufRead *.jinja set syntax=htmljinja')
vim.cmd('au BufNewFile,BufRead *.mako set ft=mako')
vim.cmd('au FileType python inoremap <buffer> $r return')
vim.cmd('au FileType python inoremap <buffer> $i import')
vim.cmd('au FileType python inoremap <buffer> $p print')
vim.cmd('au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi')
vim.cmd('au FileType python map <buffer> <leader>1 /class')
vim.cmd('au FileType python map <buffer> <leader>2 /def')
vim.cmd('au FileType python map <buffer> <leader>C ?class')
vim.cmd('au FileType python map <buffer> <leader>D ?def')
vim.cmd('au FileType python setlocal sw=2 sts=2 et')

-- Web development settings
vim.cmd('au FileType javascript,vue,html,scss,css,typescript setlocal ts=2 sw=2')
vim.cmd('au FileType vue syntax sync fromstart')

-- vimdiff colors
vim.cmd('highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white')
vim.cmd('highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black')
vim.cmd('highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black')
vim.cmd('highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black')

-- Resize splits when window resized
vim.cmd 'au VimResized * exe "normal! \\<c-w>="'

-- project local settings
if vim.fn.filereadable('.local.vim') == 1 then
    vim.cmd('source .local.vim')
end
