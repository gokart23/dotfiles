" Use pathogen to set up plugins
" Currently, the list of plugins that I use are:
" - NERDTree for directory exploration
" - TagBar for tag exploration
execute pathogen#infect()

"Set color syntax on always
syntax on

"Set backspace to normal operation
set backspace=2

"Always show cursor
set ruler

"Display line numbering
set nu

"Display EOL characters
set list

"Remap movement keys for convenience
nmap <S-h> <C-w>h
nmap <S-l> <C-w>l

"Enable l33t mode - remap arrow keys
let g:elite_mode=1

" Setting up ViM Powerline module
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

"Color scheme changes
colorscheme koehler
"Set autoindent on
set autoindent
filetype plugin indent on

"Tab related stuff - convert all tabs to 4-width spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Display incremental search results
set incsearch

" Remapping keys for useful plugins
nmap <C-f> :TagbarToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>

" Functions to change behaviour/remap things
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif
