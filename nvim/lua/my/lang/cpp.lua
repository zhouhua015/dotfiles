local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('clangd', {
    on_attach = function(client, bufnr)
        require('my.lsp').on_attach(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', ':ClangdSwitchSourceHeader<CR>', { noremap = true })
    end,
    capabilities = capabilities,
})
vim.lsp.enable('clangd')
