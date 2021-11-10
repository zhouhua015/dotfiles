local fn = vim.fn

local install_path = fn.stdpath('config')..'/autoload/plug.vim'
if fn.empty(fn.glob(install_path)) > 0 then
  plug_bootstrap = fn.system({'curl', '-fLo', install_path, '--create-dirs', 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
end

local Plug = fn['plug#']

vim.call('plug#begin', vim.fn.stdpath('config') .. '/plugged')

Plug 'junegunn/vim-plug'

-- lua config helper
Plug 'nvim-lua/plenary.nvim'

Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/matchit.zip'

Plug 'kien/ctrlp.vim'

Plug 'majutsushi/tagbar'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'

-- git
Plug 'tpope/vim-fugitive'

-- Go
Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries' })

-- C#
Plug 'OmniSharp/Omnisharp-vim'

-- Web dev, HTML/CSS auto-expanding
Plug 'mattn/emmet-vim'

Plug 'tpope/vim-obsession'

Plug 'scrooloose/syntastic'

Plug('Valloric/YouCompleteMe', { ['do'] = 'python3 ./install.py --clangd-completer --go-completer' })

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'

Plug 'rust-lang/rust.vim'

-- Colorschemes
-- Plug 'altercation/vim-colors-solarized'
-- Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'

-- syntax highlighting, indention...
Plug('leafgarland/typescript-vim', { ['for'] = 'typescript' })
Plug('solarnz/thrift.vim', { ['for'] = 'thrift' })
Plug('posva/vim-vue', { ['for'] = 'vue' })
Plug 'jparise/vim-graphql'
Plug 'cespare/vim-toml'
Plug('rhysd/vim-clang-format', { ['for'] = { 'cpp', 'c' } })

Plug 'github/copilot.vim'

vim.call('plug#end')

if plug_bootstrap then
  vim.cmd('PlugInstall')
end

return function()
  require('my.plugins.bufexplorer')
  require('my.plugins.ctrlp')
  require('my.plugins.tagbar')
  require('my.plugins.vimgo')
  require('my.plugins.omnisharp')
  require('my.plugins.vimobsession')
  require('my.plugins.syntastic')
  require('my.plugins.ycm')
  require('my.plugins.ultisnips')
  require('my.plugins.supertab')
  require('my.plugins.rust')
  require('my.plugins.papercolor')
  require('my.plugins.clangformat')
end

-- vim.cmd [[packadd packer.nvim]]
--
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])
--
-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end
--
-- return require('packer').startup(function(use)
--     use 'wbthomason/packer.nvim'
--
--     use 'vim-scripts/bufexplorer.zip'
--     use 'vim-scripts/matchit.zip'
--     use 'kien/ctrlp.vim'
--     use 'majutsushi/tagbar'
--     use 'Lokaltog/vim-easymotion'
--     use 'tpope/vim-surround'
--     -- git
--     use 'tpope/vim-fugitive'
--     -- golang
--     use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
--     -- rust
--     use 'rust-lang/rust.vim'
--     -- C#
--     use 'OmniSharp/Omnisharp-vim'
--     -- Web dev, HTML/CSS auto-expanding
--     use 'mattn/emmet-vim'
--
--     use 'honza/vim-snippets'
--     use 'tpope/vim-obsession'
--
--     use 'scrooloose/syntastic'
--     use { 'Valloric/YouCompleteMe', run = 'python3 ./install.py --clangd-completer --go-completer' }
--
--     use 'SirVer/ultisnips'
--     use 'ervandew/supertab'
--
--     -- Colorschemes
--     use 'altercation/vim-colors-solarized'
--     use 'chriskempson/base16-vim'
--     use 'NLKNguyen/papercolor-theme'
--
--     -- syntax highlighting, indention...
--     use { 'leafgarland/typescript-vim', ft = 'typescript' }
--     use { 'solarnz/thrift.vim', ft = 'thrift' }
--     use { 'posva/vim-vue', ft = 'vue' }
--     use 'jparise/vim-graphql'
--     use 'cespare/vim-toml'
--     use { 'rhysd/vim-clang-format', ft = { 'cpp', 'c' } }
--
--     use 'github/copilot.vim'
--
--     if packer_bootstrap then
--         require('packer').sync()
--     end
-- end)
--
