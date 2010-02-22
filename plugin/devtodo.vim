" devtodo.vim - A devtodo plugin
" Maintainer:   Jon Bernard

if exists("g:loaded_devtodo") || &cp
    finish
endif
let g:loaded_devtodo = 1

function! s:TodoList()
    exe "!todo --mono"
endfunction
command! -nargs=? -range=% TodoList :call s:TodoList()

function! s:TodoAdd(item)
    let item = (a:item == '' ? input("Item: ") : a:item)
    if item == ''
        echo "You must provide a todo item to add"
        return
    endif
    exe "!tda --mono \"" . item . "\""
endfunction
command! -nargs=? -range=% TodoAdd :call s:TodoAdd(<q-args>)

function! s:TodoDone(number)
    let number = (a:number == '' ? input("Number: ") : a:number)
    if number == ''
        echo "You must provide a number to mark as done"
        return
    endif
    exe "!tdd --mono " . number
endfunction
command! -nargs=? -range=% TodoDone :call s:TodoDone(<q-args>)
