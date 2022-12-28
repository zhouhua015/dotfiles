require('lspconfig').bashls.setup({
    on_attach = require('my.lsp').on_attach
})
