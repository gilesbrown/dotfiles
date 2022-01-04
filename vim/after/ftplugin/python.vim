set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" Sometimes we wear black
let b:ale_fixers = ['black', 'isort']

" This doesn't work because I run vim from the project directory
" https://codeinthehole.com/tips/using-black-and-isort-with-vim/
" let filepath = expand('%:p:h')
" if match(filepath, '/grip-core/') != -1
"    let b:ale_fix_on_save = 1
" endif
