filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set nu
syntax on


set enc=utf-8
set fileencoding=utf-8

if has("gui_running")
    set guifont=Consolas:h12
    colorscheme desert
    set langmenu=en_US
    let $lang='en-US'
endif


:nmap <Leader>s :source $MYVIMRC
