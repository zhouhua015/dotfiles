return function(packer)
    packer {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzy-native.nvim',
        },
        config = function()

            local util = require('my.util')
            util.noremap('n', '<C-p>', ':Telescope find_files<CR>')
            util.noremap('n', '<leader>o', ':Telescope buffers<CR>')
            util.noremap('n', '<leader>fg', ':Telescope live_grep<CR>')
            util.noremap('n', '<leader>fh', ':Telescope help_tags<CR>')

            require('telescope').setup  {
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close
                        },
                    },
                },
                extensions = {
                    fzy_native = {
                        override_generic_sorter = false,
                        override_file_sorter = true,
                    }
                }
            }
            require('telescope').load_extension('fzy_native')
        end,
    }
end
