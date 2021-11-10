vim.g['ctrlp_map'] = '<c-p>'
-- Use regexp search
vim.g['ctrlp_regexp'] = 1

-- These 2 options are not used when g:ctrlp_user_command defined
vim.g['ctrlp_user_command'] = {
    types = {
        ['1'] = {'.git', 'cd %s && git ls-files'},
        ['2'] = {'.hg', 'hg --cwd %s locate -I .'},
    },
    fallback = vim.fn.has('win32') == 1 and 'dir %s /-n /b /s /a-d' or 'find %s -type f',
    ignore = 1
}
