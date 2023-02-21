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
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
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
hi Pmenu ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

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

""" goyo and limelight stuff
" limelight
let g:limelight_conceal_ctermfg = 100
let g:limelight_conceal_guifg= '#83a598'

" goyo
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  hi Normal guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  "...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


""" config UltiSnips keys
let g:UltiSnipsExpandTrigger='<Right>'
let g:UltiSnipsListSnippets='<C-S-Tab>'
let g:UltiSnipsEditSplit='vertical'

""" remapings
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-J> <C-W>J
nnoremap <C-K> <C-W>K
nnoremap <C-L> <C-W>L
nnoremap <C-H> <C-W>H
