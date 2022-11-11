local map = vim.api.nvim_set_keymap

-- Run Find in files for word under cursor in vscode
map('n', '?', "<Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>", {noremap = true})
-- nnoremap ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>

-- Save
map('n', '<leader>w', "<Cmd>Write<CR>", {noremap = true})
-- nnoremap <leader>w <Cmd>Write<CR>

-- Quick move between split groups
map('n', '<C-l>', "<Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>", {noremap = true})
map('n', '<C-h>', "<Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>", {noremap = true})
map('n', '<C-j>', "<Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>", {noremap = true})
map('n', '<C-k>', "<Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>", {noremap = true})

-- Quick move between editors
map('n', '<C-a>n', "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>", {noremap = true})
map('n', '<C-a>p', "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>", {noremap = true})

-- Expand/Collapse brackets
map('n', 'zc', "<Cmd>call VSCodeNotify('editor.fold')<CR>", {noremap = true})
map('n', 'zo', "<Cmd>call VSCodeNotify('editor.unfold')<CR>", {noremap = true})

map('n', '<leader><CR>', ':noh<CR>', { silent = true })
