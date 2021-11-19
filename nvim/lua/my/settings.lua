local o = vim.opt
local util = require('my.util')
local augroup = util.augroup
local autocmd = util.autocmd

vim.g.mapleader=","

-- How many lines of history VIM has to remember
o.history=700
o.updatetime=300
-- fold settings, fold the same indent line
-- 'zc', 'za', 'zo' change the fold
o.foldmethod='indent'
o.foldlevel=99

-- 7 lines to the cursors - when moving vertical
o.scrolloff=7
o.wildignore=[[*.o,*.a,*.so,*.jar,*.tar.*,*~,*.pyc]]
o.lazyredraw=true

-- Have cursor line only in current window
augroup('show_cursor_in_cur_window_only', {
    autocmd('WinLeave', '*', 'set nocursorline'),
    autocmd('WinEnter', '*', 'set cursorline'),
})

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
o.number=true
o.relativenumber=true

-- Wait 500ms for a mapped sequence to complete
o.timeoutlen=500

o.encoding='utf8'
-- Enable syntax highlight
vim.cmd('syntax enable')

-- Enable mouse support
o.mouse='a'

-- Turn backup off, using SVN or git, no local backup
o.backup=false
o.swapfile=false

-- Jump to the last position when reopening a file
augroup('jump_to_last_pos_reopening', {
    autocmd('BufReadPost', '*', [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]),
})

-- Expand tab as blank
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
o.splitbelow=true

-- Always show the statusline
o.laststatus=2
-- Format the statusline, this is fantastic!
o.statusline='%t[%{strlen(&fenc)?&fenc:\'none\'},%{&ff}]%h%m%r%y'
o.statusline:append '%=%c,%l/%L %P'

-- Remove trailing white space
augroup('remove_trailing_white_space_on_save', {
    autocmd('BufWrite', '*', ':call DeleteTrailingWS()'),
})

-- vimdiff colors
vim.cmd('highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white')
vim.cmd('highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black')
vim.cmd('highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black')
vim.cmd('highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black')

-- Resize splits when window resized
augroup('resize_splits_when_window_resized', {
    autocmd('VimResized', '*', 'exe "normal! \\<c-w>="'),
})
