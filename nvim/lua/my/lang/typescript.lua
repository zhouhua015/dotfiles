-- Enable `ts_ls` language server
vim.lsp.enable('ts_ls')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('ts_ls', {
    on_attach = function(client, bufnr)
        require('my.lsp').on_attach(client, bufnr)
    end,
    capabilities = capabilities,
})
