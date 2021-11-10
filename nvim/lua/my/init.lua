-- Setup '<leader>'
vim.g.mapleader=","

vim.cmd('source ' .. vim.fn.stdpath('config') .. '/functions.vim')

local config_plugins = require('my.plug')
require('my.settings')
require('my.keymaps')
config_plugins()

_G.reload_my = function()
    local reload_module = require('plenary.reload').reload_module
    reload_module('my')
    require('my')
end