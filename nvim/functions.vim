function! IncludePaths()
    let curdir = getcwd()
    for include in g:local_project_includes
        let curinclude=curdir . '/' . include
        exec 'set path+=' . curinclude
    endfor
endfunction

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete ".l:currentBufNum)
   endif
endfunction
command! Bclose call <SID>BufcloseCloseIt()

function! SwitchSourceHeader()
  let basename=expand("%:t:r")
  let to=basename . "." . g:src_suffix
  if  (expand ("%:e") == "c")   ||
    \ (expand ("%:e") == "cc") ||
    \ (expand ("%:e") == "cpp") ||
    \ (expand ("%:e") == "hxx") ||
    \ (expand ("%:e") == "hpp")
    let to=basename . '.h'
  endif

  exec 'find ' . to
endfunction

function! RefreshTags()
    cs kill 0
    if has('Win32')
        let cmd = "update_cscope.bat"
    else
        let cmd = "./update_cscope.sh " . getcwd()
    endif

    echo cmd
    echo system(cmd)
    if v:shell_error
        echohl ErrorMsg | echom 'Failed to run ' . cmd | echohl NONE
    endif

    if filereadable("cscope.out")
        cs add cscope.out
    endif
endfunction

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("grep -o -R -P " . '"'. l:pattern . '"' . ' .')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
