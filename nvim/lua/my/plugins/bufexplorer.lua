vim.g['bufExplorerDefaultHelp']=0
--  Do not show default help
vim.g['bufExplorerDefaultHelp']=0
--  Show relative paths
vim.g['bufExplorerShowRelativePath']=1
--  Sort by the buffer's name.
vim.g['bufExplorerSortBy']='name'

vim.api.nvim_set_keymap('n', '<leader>o', ':BufExplorer<CR>', {})