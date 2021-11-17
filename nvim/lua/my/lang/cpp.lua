local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('lspconfig').clangd.setup({
    on_attach = require('my.lsp').on_attach,
    capabilities = capabilities,
})

vim.api.nvim_set_keymap('n', '<leader>s', ':ClangdSwitchSourceHeader<CR>', { noremap = true })
