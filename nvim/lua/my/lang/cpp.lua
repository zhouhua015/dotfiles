local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('clangd', {
    on_attach = function(client, bufnr)
        require('my.lsp').on_attach(client, bufnr)

        -- Create the ClangdSwitchSourceHeader command
        vim.api.nvim_buf_create_user_command(bufnr, "ClangdSwitchSourceHeader", function()
          local params = { uri = vim.uri_from_bufnr(bufnr) }
          client.request("textDocument/switchSourceHeader", params, function(err, result)
            if err then
              print("Error switching source/header: " .. tostring(err))
              return
            end
            if not result then
              print("Corresponding file not found")
              return
            end
            vim.api.nvim_command("edit " .. vim.uri_to_fname(result))
          end)
        end, { desc = "Switch between source and header" })

        vim.keymap.set("n", "<leader>s", "<cmd>ClangdSwitchSourceHeader<cr>", { buffer = bufnr, noremap = true })
        -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', ':ClangdSwitchSourceHeader<CR>', { noremap = true })
    end,

    capabilities = capabilities,
})
vim.lsp.enable('clangd')
