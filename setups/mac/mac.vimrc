" EXPO VIM CONFIGS FOR MAC .. AND MAYBE LINUX..? 
" Add to 'Plug' lines for plugin tool to grab plugins

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugin
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdcommenter'

" PYTHON PLUGINS (also for other)
Plug 'davidhalter/jedi-vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim'

" JAVA PLUGINS
Plug 'artur-shaik/vim-javacomplete2'
			
" Julia
Plug 'https://github.com/JuliaEditorSupport/julia-vim'

" Go
Plug 'https://github.com/fatih/vim-go'

" ========================================================
" THE FOLLOWING SECTION PROVIDES EXAMPLES ON DIFFERENT WAYS TO GRAB A PLUGIN WITH VIM-PLUG
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'



" INITITALIZE PLUGIN SYSTEM
call plug#end()

" PYTHON CONFIGS
highlight BadWhitespace ctermbg=red guibg=darkre

au BufNewFile,BufRead *.py,*.php,*.rb,*.html,*.js,*.ts,*.md
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set showmatch |
    \ match BadWhitespace /\s\+$/ |
    \ set encoding=utf-8 |
    \ let python_highlight_all=1 |
    \ syntax on

" JAVA CONFIGS
au BufNewFile,BufRead *.java
autocmd FileType java setlocal omnifunc=javacomplete#Complete

nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" TODO - this website for more vim-javacomplete2 configs
" https://github.com/artur-shaik/vim-javacomplete2



" GLOBAL GLOBAL GLOBAL CONFIGS ===================================

" Standard Configs
set number
inoremap jj <ESC>
map ; :
noremap ;; ;
set tags=tags;/

" Nerd Tree Global
map :n :NERDTreeToggle<CR>

"CSCOPE custom map
nmap <C-@><C-@> :cs find s <C-R>=expand("<cword>")<CR><CR>

" CTAGS
set tags=tags

" NerdTree Mapping
