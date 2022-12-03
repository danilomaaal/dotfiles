"       o               
" .    ,.,-.-.,---.,---.
"  \  / || | ||    |    
"   `'  `` ' '`    `---'

""" install vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" pluggins
call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'jpalardy/vim-slime'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'fladson/vim-kitty'
Plug 'ryanoasis/vim-devicons'
call plug#end()

""" basic configs
" setting
syntax on 

" hybrid numbers
set number
set relativenumber

" default encoding
set encoding=utf8

" split screen
set splitbelow
set splitright

" kitty stuff
" if using kitty set
let &t_ut=''

" config vim slime
let g:slime_target = 'kitty'

"  avoid braking ipython identation when using slime
let g:slime_python_ipython = 1

""" enable theme 
colorscheme shades_of_purple

if (has("termguicolors"))
 set termguicolors
endif


" set tranparency
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

""" config status line (lightline) 
set laststatus=2
 
if !has('gui_running')
  set t_Co=256
endif

let g:shades_of_purple_lightline = 1

let g:lightline = {
      \ 'colorscheme': 'shades_of_purple'
      \ }

" remove the --INSERT--
set noshowmode

""" config UltiSnips keys
let g:UltiSnipsExpandTrigger='<Right>'
let g:UltiSnipsListSnippets='<C-S-Tab>'
let g:UltiSnipsEditSplit='vertical'

""" remapings
nnoremap <C-J> <C-W>J
nnoremap <C-K> <C-W>K
nnoremap <C-L> <C-W>L
nnoremap <C-H> <C-W>H
