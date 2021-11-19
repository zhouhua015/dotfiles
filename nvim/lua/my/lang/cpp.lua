local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('lspconfig').clangd.setup({
    on_attach = function(client, bufnr)
        require('my.lsp').on_attach(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', ':ClangdSwitchSourceHeader<CR>', { noremap = true })
    end,
    capabilities = capabilities,
})
