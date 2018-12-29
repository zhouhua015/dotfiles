"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Include path settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set includes to path
if has('Win32')
    let s:includes=[
                \"DIRECTORY_1/", 
                \"DIRECTORY_2/**"]
else
    let s:includes=split(system('find . -type f -name "*.h" -exec dirname {} \;|sort|uniq'), '\n')
endif

call IncludePaths()

let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = getcwd() .'/.cache/ctrlp'
