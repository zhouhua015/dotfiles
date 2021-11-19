_G.reload_my = function()
    local reload_module = require('plenary.reload').reload_module
    reload_module('my')
    require('my')
end

vim.cmd('source '..vim.fn.escape(vim.fn.stdpath('config'), '\\ ')..'/functions.vim')

require('my.settings')
require('my.keymaps')
require('my.plug')

if vim.fn.filereadable('.local.vim') == 1 then
    vim.cmd('source .local.vim')
end

-- local config_plugins = require('my.plug')
-- require('my.settings')
-- require('my.keymaps')
-- require('my.lang')
-- config_plugins()

