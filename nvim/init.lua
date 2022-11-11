if vim.fn.exists('g:vscode') == 1 then
    require('vscode')
else
    require('my')
end
