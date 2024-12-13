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
Plug 'rose-pine/vim'
Plug 'fladson/vim-kitty'
Plug 'ryanoasis/vim-devicons'
Plug 'zah/nim.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-pandoc/vim-markdownfootnotes'
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
colorscheme rosepine_moon

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

let g:lightline = {
      \ 'colorscheme': 'rosepine_moon'
      \ }

" remove the --INSERT--
set noshowmode
set shell=/usr/bin/zsh

"" youcompleteme additional servers
let g:ycm_language_server = [
      \ {
      \   'name': 'r',
      \   'filetypes': ['r'],
      \   'cmdline': ['/usr/bin/R', '--slave', '-e', 'languageserver::run()'],
      \   'project_root_files': ['renv.lock']
      \ },
      \ {
      \   'name': 'rust',
      \   'cmdline': [ 'ra_lsp_server' ],
      \   'filetypes': [ 'rust' ],
      \   'project_root_files': [ 'Cargo.toml' ]
      \ },
      \ {
      \   'name': 'julia',
      \   'filetypes': [ 'julia' ],
      \   'project_root_files': [ 'Project.toml' ],
      \	  'cmdline': ['julia', '--startup-file=no', '--history-file=no', '-e', '
      \       using LanguageServer;
      \       using Pkg;
      \       import StaticLint;
      \       import SymbolServer;
      \       env_path = dirname(Pkg.Types.Context().env.project_file);
      \       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
      \       server.runlinter = true;
      \       run(server);
      \   ']
      \}
   \ ]


""" goyo and limelight stuff
" limelight
let g:limelight_conceal_ctermfg=100
let g:limelight_conceal_guifg='#83a598'

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
"
au BufNewFile,BufRead *.nim set filetype=nim

fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

""" config UltiSnips keys
let g:UltiSnipsExpandTrigger='<Right>'
let g:UltiSnipsListSnippets='<C-S-Tab>'
let g:UltiSnipsEditSplit='vertical'

""" remapings
let mapleader = ","
nnoremap <M-n> :NERDTree<CR>
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-h> <C-w>h

""" terminal in split window
map <Leader>t :term ++close<cr>
tmap <Leader>t <c-w>:term ++close<cr>

