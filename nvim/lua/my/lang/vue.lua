-- 1. Dynamically get the global npm root path for the Vue hybrid plugin
local global_npm_root = vim.fn.trim(vim.fn.system('npm root -g'))
local vue_language_server_path = global_npm_root .. '/@vue/language-server'

-- 2. Define shared properties
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
    require('my.lsp').on_attach(client, bufnr)
end

-- 3. Configure vtsls (Replacing ts_ls completely)
vim.lsp.config('vtsls', {
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.bo[bufnr].shiftwidth = 2
        vim.bo[bufnr].softtabstop = 2
        vim.bo[bufnr].tabstop = 2
    end,
    capabilities = capabilities,
    -- Extend default vtsls filetypes to include vue
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    {
                        name = '@vue/typescript-plugin',
                        location = vue_language_server_path,
                        languages = { 'vue' },
                        configNamespace = 'typescript',
                    },
                },
            },
        },
    },
})

-- 4. Configure vue_ls (The forwarding logic is handled natively by your up-to-date lspconfig)
vim.lsp.config('vue_ls', {
    on_attach = on_attach,
    capabilities = capabilities,
})

-- 5. Simultaneously enable both servers
vim.lsp.enable({ 'vtsls', 'vue_ls' })
