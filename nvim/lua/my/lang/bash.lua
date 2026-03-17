vim.lsp.config('bashls', {
    on_attach = require('my.lsp').on_attach
})
vim.lsp.enable('bashls')
