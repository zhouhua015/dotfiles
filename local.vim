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
