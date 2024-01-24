return function(packer)
    packer {
        'simrat39/rust-tools.nvim',

        config = function()
            local nvim_lsp = require 'lspconfig'

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local rt = require 'rust-tools'
            rt.setup({
                tools = {
                    autoSetHints = true,

                    inlay_hints = {
                        other_hints_prefix = "",
                        parameter_hints_prefix = "",
                        show_parameter_hints = false,
                    },
                },

                -- all the opts to send to nvim-lspconfig
                server = {
                    on_attach = function(client, bufnr)
                        -- Hover actions
                        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                        -- Code action groups
                        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                        require('my.lsp').on_attach(client, bufnr)
                    end,
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
            })
        end,
    }
end
