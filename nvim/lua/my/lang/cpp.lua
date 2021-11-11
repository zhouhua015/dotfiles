require('lspconfig').clangd.setup({
    on_attach = require('my.lsp').on_attach,
})
