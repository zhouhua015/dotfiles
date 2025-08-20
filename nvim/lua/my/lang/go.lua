return function(packer)
    packer {
        'ray-x/go.nvim',

        config = function()
            require('go').setup()
            local util = require('my.util')
            local augroup = util.augroup
            local autocmd = util.autocmd

            local nvim_lsp = require 'lspconfig'
            local configs = require 'lspconfig.configs'

            if not configs.golangcilsp then
                configs.golangcilsp = {
                    default_config = {
                        cmd = {'golangci-lint-langserver'},
                        root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod'),
                        init_options = {
                            command = { "golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1" };
                        },
                    };
                }
            end

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            cfg = {
                on_attach = function(client, bufnr)
                    require('my.lsp').on_attach(client, bufnr)

                    -- overwrite the auto-command group in lsp.lua
                    augroup('format_on_save', {
                        -- autocmd('BufNewFile,BufRead', '*.go', 'setlocal noexpandtab tabstop=2 shiftwidth=2'),
                        autocmd('BufWritePre', '*.go', "lua require('go.format').goimports()"),
                    })
                end,
                capabilities = capabilities,
            }

            nvim_lsp.gopls.setup(cfg)
            nvim_lsp.golangci_lint_ls.setup {
                filetypes = {'go', 'gomod'}
            }
        end,
    }
end
