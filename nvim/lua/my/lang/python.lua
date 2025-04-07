vim.cmd('au FileType python syn keyword pythonDecorator True None False self')
vim.cmd('au BufNewFile,BufRead *.jinja set syntax=htmljinja')
vim.cmd('au BufNewFile,BufRead *.mako set ft=mako')
vim.cmd('au FileType python inoremap <buffer> $r return')
vim.cmd('au FileType python inoremap <buffer> $i import')
vim.cmd('au FileType python inoremap <buffer> $p print')
vim.cmd('au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi')
vim.cmd('au FileType python map <buffer> <leader>1 /class')
vim.cmd('au FileType python map <buffer> <leader>2 /def')
vim.cmd('au FileType python map <buffer> <leader>C ?class')
vim.cmd('au FileType python map <buffer> <leader>D ?def')
-- vim.cmd('au FileType python setlocal sw=2 sts=2 et')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'.pylsp.setup({
    on_attach = function(client, bufnr)
        require('my.lsp').on_attach(client, bufnr)
    end,
    capabilities = capabilities,
})

require('lspconfig').ruff.setup({
    on_attach = function(client, bufnr)
        require('my.lsp').on_attach(client, bufnr)

        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --     group = vim.api.nvim_create_augroup('FormatRuff', { clear = true }),
        --     pattern = "*.py",
        --     callback = function()
        --         vim.lsp.buf.format { async = true, bufnr = bufnr }
        --     end,
        --     desc = 'LSP: Ruff format on save',
        -- })
    end,
    capabilities = capabilities,
})

