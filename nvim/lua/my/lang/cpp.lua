require('lspconfig').clangd.setup({
    on_attach = require('my.lsp').on_attach,
})

vim.api.nvim_set_keymap('n', '<leader>s', ':ClangdSwitchSourceHeader<CR>', { noremap = true })
