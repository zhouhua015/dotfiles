local M = {}

function M.init(packer)
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    packer {
        'neovim/nvim-lspconfig',
        config = function()
            local function vim_kv_args(args)
                local arg_strs = {}
                for key, arg in pairs(args) do
                    table.insert(arg_strs, string.format('%s=%s', key, arg))
                end
                return table.concat(arg_strs, " ")
            end

            local function sign_define(name, args)
                local arg = vim_kv_args(args)
                vim.cmd(string.format('sign define %s %s', name, arg))
            end

            sign_define('LspDiagnosticsSignError',
            {text='x', texthl='LspDiagnosticsError', linehl='', numhl=''})
            sign_define('LspDiagnosticsSignWarning',
            {text='!', texthl='LspDiagnosticsWarning', linehl='', numhl=''})
            sign_define('LspDiagnosticsSignInformation',
            {text='~', texthl='LspDiagnosticsInformation', linehl='', numhl=''})
            sign_define('LspDiagnosticsSignHint',
            {text='?', texthl='LspDiagnosticsHint', linehl='', numhl=''})
        end,
    }
    packer "ray-x/lsp_signature.nvim"
end

function M.on_attach(client, bufnr)
    require "lsp_signature".on_attach({
        floating_window_above_cur_line = true,
        hint_enable = false,
        hint_prefix = "P: ",
        timer_interval = 100,
    }, bufnr)

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('v', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlightProvider then
        vim.cmd [[
            hi! LspReferenceRead cterm='underline' ctermfg=5 gui='underline' guifg='SlateBlue'
            hi! LspReferenceText cterm='underline' ctermfg=5 gui='underline' guifg='SlateBlue'
            hi! LspReferenceWrite cterm='underline' ctermfg=5 gui='underline' guifg='SlateBlue'
          ]]
        vim.api.nvim_create_augroup('lsp_document_highlight', {
          clear = false
        })
        vim.api.nvim_clear_autocmds({
          buffer = bufnr,
          group = 'lsp_document_highlight',
        })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          group = 'lsp_document_highlight',
          buffer = bufnr,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          group = 'lsp_document_highlight',
          buffer = bufnr,
          callback = vim.lsp.buf.clear_references,
        })
    end

    -- format_on_save
    local util = require('my.util')
    local augroup = util.augroup
    local autocmd = util.autocmd
    augroup('format_on_save', {
        autocmd('BufWritePre', '<buffer>', ':silent! lua vim.lsp.buf.formatting()'),
    })
end

return M
