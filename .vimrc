" Use pathogen to set up plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Currently, the list of plugins that I use are:
" - NERDTree for directory exploration
" - TagBar for tag exploration
execute pathogen#infect()

"Set color syntax on always
syntax on

"Enable smart casing for search, etc.
set ignorecase
set smartcase

"Remap ex prefix to semi-colon - this will interfere with next occurrence!
nnoremap ; :
vnoremap ; :
"Remap next-occurrence the other way (ie, to colon) - not an alias loop since
"we do a noremap
nnoremap : ;

"Set backspace to normal operation
set backspace=2

"Always show cursor
set ruler

"Display line numbering, and relative numbering
set nu rnu

"Display EOL characters
set list

"Remap movement keys for convenience
nmap <S-h> <C-w>h
nmap <S-l> <C-w>l

"Enable l33t mode - disable arrow keys
let g:elite_mode=1

" Setting up ViM Powerline module
" 28/Aug - Turning off since powerline modules seem to be broken after Arch
" upgrade
" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

"Color scheme changes
colorscheme molokai
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

let g:NERDTreeWinSize=20
let g:tagbar_width=27

""" GO Configuration Section
" Vim-Go configuration
let g:go_disable_autoinstall = 0

" Highlight
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
""" END Go configuration section

" Code style - set column width
set colorcolumn=80

" Functions to change behaviour/remap things
if get(g:, 'elite_mode')
    nnoremap <Up>    <Nop>
    nnoremap <Down>  <Nop>
    nnoremap <Left>  <Nop>
    nnoremap <Right> <Nop>
endif
