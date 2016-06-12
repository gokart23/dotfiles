"Set color syntax on always
syntax on
"Set autoindent on
set autoindent
"Set backspace to normal operation
set backspace=2
"Always show cursor
set ruler
" Commented out command below - can be used to display extra whitespace
" set list listchars=tab:>>,trail:~,nbsp:~
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
"Color scheme changes

"UNUSED - Install peaksea.vim in .vim/colors to enable this scheme
"set background=dark
"color peaksea/solarized
"USED - Right now, desert theme seems to work out fine
colorscheme desert
