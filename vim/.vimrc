"       o               
" .    ,.,-.-.,---.,---.
"  \  / || | ||    |    
"   `'  `` ' '`    `---'

" install vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" pluggins
call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'jpalardy/vim-slime'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mhartington/oceanic-next'
call plug#end()

" relative numbers
set relativenumber

" default encoding
set encoding=utf8

" if using kitty terminal
let &t_ut=''

" enable theme oceanic for vim 8
syntax on

" italics and bold
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1 

if (has("termguicolors"))
 set termguicolors
endif

colorscheme OceanicNext

let g:airline_theme='oceanicnext'

" set tranparency
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" status line (lightline) config
set laststatus=2
 
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" remove the --INSERT--
set noshowmode

" config vim slime for kitty
let g:slime_target = "kitty"
