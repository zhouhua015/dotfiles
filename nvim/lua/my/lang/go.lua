return function(packer)
    packer {
        'ray-x/go.nvim',

        config = function()
            require('go').setup()
            local util = require('my.util')
            local augroup = util.augroup
            local autocmd = util.autocmd

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.lsp.config('gopls', {
                on_attach = function(client, bufnr)
                    require('my.lsp').on_attach(client, bufnr)

                    -- overwrite the auto-command group in lsp.lua
                    augroup('format_on_save', {
                        -- autocmd('BufNewFile,BufRead', '*.go', 'setlocal noexpandtab tabstop=2 shiftwidth=2'),
                        autocmd('BufWritePre', '*.go', "lua require('go.format').goimports()"),
                    })
                end,
                capabilities = capabilities,
            })

            vim.lsp.enable('gopls')
            vim.lsp.enable('golangci_lint_ls')
        end,
    }
end
