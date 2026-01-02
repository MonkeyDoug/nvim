" function! Get_visual_selection()
"     " Why is this not a built-in Vim script function?!
"     let [line_start, column_start] = getpos("'<")[1:2]
"     let [line_end, column_end] = getpos("'>")[1:2]
"     let lines = getline(line_start, line_end)
"     if len(lines) == 0
"         return ''
"     endif
"     let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
"     let lines[0] = lines[0][column_start - 1:]
"     echo join(lines,"\n")
"     return join(lines, "\n")
" endfunction

function! Get_visual_selection()
        :echo getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]
endfunction

if exists('g:neovide')
        function ChangeFontSize(delta) abort
          let l:repl = printf('\=eval(submatch(0)+%d)', a:delta)
          let &guifont = substitute(&guifont, '\d\+', l:repl, '')
        endfunction
endif
