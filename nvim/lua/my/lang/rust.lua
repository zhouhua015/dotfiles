return function(packer)
    packer {
        'simrat39/rust-tools.nvim',

        config = function()
            local nvim_lsp = require 'lspconfig'

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

            local opts = {
                tools = {
                    autoSetHints = true,
                    hover_with_actions = true,

                    inlay_hints = {
                        other_hints_prefix = "",
                        parameter_hints_prefix = "",
                        show_parameter_hints = false,
                    },
                },

                -- all the opts to send to nvim-lspconfig
                server = {
                    on_attach = require('my.lsp').on_attach,
                    capabilities = capabilities,
                    settings = {
                        ["rust-analyzer"] = {
                            -- enable clippy on save
                            checkOnSave = {
                                command = "clippy"
                            },
                        }
                    }
                },
            }
            require('rust-tools').setup(opts)
        end,
    }
end
