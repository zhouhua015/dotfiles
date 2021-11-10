local cmd = vim.cmd

cmd('au FileType go nmap <leader>r <Plug>(go-run)')
cmd('au FileType go nmap <leader>b <Plug>(go-build)')
cmd('au FileType go nmap <leader>t <Plug>(go-test)')
cmd('au FileType go nmap <leader>c <Plug>(go-coverage)')
cmd('au FileType go nmap <Leader>ds <Plug>(go-def-split)')
cmd('au FileType go nmap <Leader>dv <Plug>(go-def-vertical)')
cmd('au FileType go nmap <Leader>dt <Plug>(go-def-tab)')
cmd('au FileType go nmap <Leader>gd <Plug>(go-doc)')
cmd('au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)')
cmd('au FileType go nmap <Leader>s <Plug>(go-implements)')
cmd('au FileType go nmap <Leader>i <Plug>(go-info)')
cmd('au FileType go nmap <Leader>e <Plug>(go-rename)')
cmd('au FileType go nmap <Leader>l <Plug>(go-lint)')
cmd('au FileType go nmap <Leader>v <Plug>(go-vet)')
cmd('au FileType go nmap <Leader>k <Plug>(go-errcheck)')

vim.g.go_def_mode = 'godef'
vim.g.go_highlight_types = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_fmt_command = "goimports"
vim.g.go_fmt_fail_silently = 1

if vim.fn.has("win32") then
    vim.g.go_gocode_socket_type = 'tcp'
end

