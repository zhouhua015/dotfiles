local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('go').setup({
    lsp_codelens = false,
    lsp_cfg = false, -- we'll config `gopls`
})

vim.lsp.config('gopls', {
    on_attach = function(client, bufnr)
        require('my.lsp').on_attach(client, bufnr)

        local group = vim.api.nvim_create_augroup("format_on_save_go", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = group,
            buffer = bufnr,
            callback = function()
                require('go.format').goimports()
            end,
        })
    end,
    capabilities = capabilities
    -- settings = {
    --     gopls = {
    --
    --     }
    -- }
})

vim.lsp.enable('gopls')
vim.lsp.enable('golangci_lint_ls')

-- return function(packer)
--     packer {
--         'ray-x/go.nvim',
--
--         config = function()
--             require('go').setup({
--                 lsp_codelens = false,
--             })
--             local util = require('my.util')
--             local augroup = util.augroup
--             local autocmd = util.autocmd
--
--             local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
--             vim.lsp.config('gopls', {
--                 on_attach = function(client, bufnr)
--                     require('my.lsp').on_attach(client, bufnr)
--
--                     -- overwrite the auto-command group in lsp.lua
--                     augroup('format_on_save', {
--                         -- autocmd('BufNewFile,BufRead', '*.go', 'setlocal noexpandtab tabstop=2 shiftwidth=2'),
--                         autocmd('BufWritePre', '*.go', "lua require('go.format').goimports()"),
--                     })
--                 end,
--                 capabilities = capabilities,
--             })
--
--             vim.lsp.enable('gopls')
--             vim.lsp.enable('golangci_lint_ls')
--         end,
--     }
-- end
