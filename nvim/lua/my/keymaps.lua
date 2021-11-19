local map = vim.api.nvim_set_keymap

-- Fast reload the init.lua file
map('n', '<leader>ss', 'v:lua.reload_my()', { noremap = true, expr = true })
-- Fast editing of init.lua
map('n', '<leader>ee', ':e ' .. vim.fn.escape(vim.fn.stdpath('config'), '\\ ') .. '/lua/my/init.lua<CR>', { noremap = true })
-- Fast saving
map('n', '<leader>w', ':w!<CR>', { silent = true })
-- Fast obsession and quiting
map('n', '<leader>q', ':mksession!<CR>:qa<CR>', { silent = true })

-- Easier search
map('n', '<space>', '/', {})
map('n', '<leader><CR>', ':noh<CR>', { silent = true })

-- Smart way to move between windows
map('n', '<C-j>', '<C-W>j', {})
map('n', '<C-k>', '<C-W>k', {})
map('n', '<C-h>', '<C-W>h', {})
map('n', '<C-l>', '<C-W>l', {})

-- Fix the horribly default regex handling
map('n', '/', '/\\v', { noremap = true })
map('v', '/', '/\\v', { noremap = true })
map('n', '?', '?\\v', { noremap = true })
map('v', '?', '?\\v', { noremap = true })

-- Make Y behave like other capitals
map('n', 'Y', 'y$', { noremap = true })

-- Avoid the bloody far <Esc>
map('i', 'jk', '<Esc>', { noremap = true })
map('i', 'kj', '<Esc>', { noremap = true })

-- Use the arrows switch among buffers
map('n', '<right>', ':bn<CR>', {})
map('n', '<left>', ' :bp<CR>', {})

-- When pressing <leader>cd switch to the directory of the open buffer
map('n', '<leader>cd', ':cd %:p:h<CR>', {})

-- Parenthesis/bracket expanding
map('v', '$1', '<esc>`>a)<esc>`<i(<esc>', { noremap = true })
map('v', '$2', '<esc>`>a]<esc>`<i[<esc>', { noremap = true })
map('v', '$3', '<esc>`>a}<esc>`<i{<esc>', { noremap = true })
map('v', '$$', '<esc>`>a"<esc>`<i"<esc>', { noremap = true })
map('v', '$q', '<esc>`>a\'<esc>`<i\'<esc>', { noremap = true })
map('v', '$e', '<esc>`>a"<esc>`<i"<esc>', { noremap = true })

map('i', '$1', '()<esc>i', { noremap = true })
map('i', '$2', '[]<esc>i', { noremap = true })
map('i', '$3', '{}<esc>i', { noremap = true })
map('i', '$4', '{<esc>o}<esc>0', { noremap = true })
map('i', '$q', '\'\'<esc>i', { noremap = true })
map('i', '$e', '""<esc>i', { noremap = true })
map('i', '$t', '<><esc>i', { noremap = true })

-- quickfix
map('n', '<leader><space>', ':w<CR>:make<CR>', {})
map('n', '<leader>cc', ':botright cope<cr>', {})
map('n', '<leader>cn', ':cn<cr>', {})
map('n', '<leader>cp', ':cp<cr>', {})
map('n', '<leader>ccl', ':ccl<cr>', {})

-- -- AutoComplete
-- map('i', '<C-]>', '<C-X><C-]>', { noremap = true })
-- map('i', '<C-F>', '<C-X><C-F>', { noremap = true })
-- map('i', '<C-D>', '<C-X><C-D>', { noremap = true })
-- map('i', '<C-L>', '<C-X><C-L>', { noremap = true })
-- map('i', '<C-P>', '<C-X><C-P>', { noremap = true })

-- Arrow fixing
map('n', '<Esc>A', '<up>', { noremap = true })
map('n', '<Esc>B', '<down>', { noremap = true })
map('n', '<Esc>C', '<right>', { noremap = true })
map('n', '<Esc>D', '<left>', { noremap = true })
map('i', '<Esc>A', '<up>', { noremap = true })
map('i', '<Esc>B', '<down>', { noremap = true })
map('i', '<Esc>C', '<right>', { noremap = true })
map('i', '<Esc>D', '<left>', { noremap = true })

-- Close the current buffer without saving
map('n', '<leader>bd', ':Bclose<CR>', {})

-- Swap windows
map('n', '<leader>mw', ':call MarkWindowSwap()<CR>', { silent = true })
map('n', '<leader>pw', ':call DoWindowSwap()<CR>', { silent = true })

-- Visual search
map('v', '*', ':call VisualSearch(\'f\')<CR>', { noremap = true, silent = true })
map('v', '#', ':call VisualSearch(\'b\')<CR>', { noremap = true, silent = true })

-- When you press gv you vimgrep after the selected text
map('v', 'gv', ':call VisualSearch(\'gv\')<CR>', { noremap = true, silent = true })
-- Quick search
map('n', '<leader>g', ':grep -o -R -P "" .<left><left><left>', {})
