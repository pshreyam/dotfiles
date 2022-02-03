" Startify config file

let g:startify_custom_header = [
         \ '  _______                    .__          ',
         \ '  \      \   ____  _______  _|__| _____   ',
         \ '  /   |   \_/ __ \/  _ \  \/ /  |/     \  ',
         \ ' /    |    \  ___(  <_> )   /|  |  Y Y  \ ',
         \ ' \____|__  /\___  >____/ \_/ |__|__|_|  / ',
         \ '         \/     \/                    \/  ',
         \ ]

let g:startify_session_dir = '~/.config/nvim/session'

" offset headers by 3 spaces
let g:startify_lists = [
       \ { 'type': 'files', 'header': ['   Files'] },
       \ { 'type': 'sessions', 'header': ['   Sessions'] },
       \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
       \ ]

let g:startify_bookmarks = [
         \ { 'z': '~/.zshrc' },
         \ { 'n': '~/.config/nvim/init.vim' },
         \ { 'b': '~/.config/bspwm/bspwmrc' },
         \ { 's': '~/.config/sxhkd/sxhkdrc' },
         \ { 'p': '~/.config/polybar/config' },
         \ { 't': '~/.config/zathura/zathurarc' },
         \ { 'r': '~/.config/ranger/rc.conf' },
         \ { 'd': '~/.config/dunst/dunstrc' },
         \ '~/Downloads/repos',
         \ ]

" centers the given parameter
function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

" center the custom header
let g:startify_custom_header = s:center(g:startify_custom_header)
