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
        'vim-scripts/bufexplorer.zip',
        config = function()
            vim.g.bufExplorerDefaultHelp=0
            --  Do not show default help
            vim.g.bufExplorerDefaultHelp=0
            --  Show relative paths
            vim.g.bufExplorerShowRelativePath=1
            --  Sort by the buffer's name.
            vim.g.bufExplorerSortBy='name'
            vim.api.nvim_set_keymap('n', '<leader>o', ':BufExplorer<CR>', {})
        end,
    }

    -- use {
    --     'kien/ctrlp.vim',
    --     config = function()
    --         vim.g.ctrlp_map = '<c-p>'
    --         -- Use regexp search
    --         vim.g.ctrlp_regexp = 1

    --         -- These 2 options are not used when g:ctrlp_user_command defined
    --         vim.g.ctrlp_user_command = {
    --             types = {
    --                 ['1'] = {'.git', 'cd %s && git ls-files'},
    --                 ['2'] = {'.hg', 'hg --cwd %s locate -I .'},
    --             },
    --             fallback = vim.fn.has('win32') == 1 and 'dir %s /-n /b /s /a-d' or 'find %s -type f',
    --             ignore = 1
    --         }
    --     end,
    -- }

    use {
        'majutsushi/tagbar',
        config = function()
            vim.g.tagbar_autoclose=1
            vim.g.tagbar_autofocus=1
            vim.api.nvim_set_keymap('n', '<F9>', ':TagbarToggle<CR>', { silent = true })
        end,
    }

    use {
        'tpope/vim-obsession',
        config = function()
            -- show obsession status
            vim.opt.statusline:append ' %{ObsessionStatus()}'
        end,
    }

    -- use {
    --     'SirVer/ultisnips',
    --     requires = 'honza/vim-snippets',
    --     config = function()
    --         vim.g.UltiSnipsRemoveSelectModeMappings = 0
    --     end,
    -- }

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
