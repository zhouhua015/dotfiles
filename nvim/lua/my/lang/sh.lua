return function(packer)
    packer {
        'scrooloose/syntastic',
        ft = 'sh',
        config = function()
            vim.g.syntastic_sh_checkers = 'shellcheck'
            vim.g.syntastic_sh_shellcheck_args = '-x'
        end,
    }

end
