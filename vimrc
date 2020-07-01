autocmd FileType python setlocal listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
filetype indent plugin on
syntax on
set ruler
set belloff=all
set visualbell
set tags=tags
" https://shapeshed.com/vim-netrw/
let g:netrw_browse_split = 3
let g:netrw_liststyle = 3
autocmd BufWritePost *.py silent! !ctags -R --python-kinds=-i --languages=python 2>/dev/null &
nnoremap <F10> :call VimuxRunCommandInDir("~/.vim/vimux-pytest", 1)<CR>
