local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- use 'vim-scripts/matchit.zip'
    use 'Lokaltog/vim-easymotion'
    use 'tpope/vim-surround'

    use {
        'majutsushi/tagbar',
        config = function()
            vim.g.tagbar_autoclose=1
            vim.g.tagbar_autofocus=1
            vim.api.nvim_set_keymap('n', '<F9>', ':TagbarToggle<CR>', { silent = true })
        end,
    }

    use {
        'NLKNguyen/papercolor-theme',
        config = function()
            vim.opt.background='light'
            vim.cmd('colorscheme PaperColor')
        end,
    }

    use 'github/copilot.vim'

    use 'cespare/vim-toml'
    use 'jparise/vim-graphql'
    use { 'solarnz/thrift.vim', ft = 'thrift' }
    -- use { 'rhysd/vim-clang-format', ft = { 'cpp', 'c' } }

    require('my.telescope')(use)
    require('my.git')(use)
    require('my.treesitter')(use)
    require('my.lsp').init(use)
    require('my.nvim-cmp')(use)

    require('my.lang.go')(use)
    require('my.lang.rust')(use)
    require('my.lang.sh')(use)

    if packer_bootstrap then
        require('packer').sync()
    end
end)

require('my.lang.cpp')
