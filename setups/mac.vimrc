" EXPO VIM CONFIGS FOR MAC .. AND MAYBE LINUX..? 

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

" PYTHON PLUGINS (also for other)
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim'

" JAVA PLUGINS
Plug 'artur-shaik/vim-javacomplete2'

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
    \ autocmd FileType java setlocal omnifunc=javacomplete#Complete

" GLOBAL GLOBAL GLOBAL CONFIGS ===================================

" Standard Configs
set number
inoremap jj <ESC>
map ; :
noremap ;; ;

" Nerd Tree Global
map <C-n> :NERDTreeToggle<CR>

"CSCOPE custom map
nmap <C-@><C-@> :cs find s <C-R>=expand("<cword>")<CR><CR>

" CTAGS
set tags=tags

" NerdTree Mapping

" Quick jump to first item starting with X
function! s:NERDJump(search, backwards)
    if a:backwards
        :silent! :exe '?\c\(|\|`\)\(\~\|+\|-\)'.a:search
    else
        :silent! :exe '/\c\(|\|`\)\(\~\|+\|-\)'.a:search
    end
endfunction
command! -nargs=* NERDJump call s:NERDJump(<f-args>)

" Search forwards
nmap <buffer> na :NERDJump a 0<CR>
nmap <buffer> nb :NERDJump b 0<CR>
nmap <buffer> nc :NERDJump c 0<CR>
nmap <buffer> nd :NERDJump d 0<CR>
nmap <buffer> ne :NERDJump e 0<CR>
nmap <buffer> nf :NERDJump f 0<CR>
nmap <buffer> ng :NERDJump g 0<CR>
nmap <buffer> nh :NERDJump h 0<CR>
nmap <buffer> ni :NERDJump i 0<CR>
nmap <buffer> nj :NERDJump j 0<CR>
nmap <buffer> nk :NERDJump k 0<CR>
nmap <buffer> nl :NERDJump l 0<CR>
nmap <buffer> nm :NERDJump m 0<CR>
nmap <buffer> nn :NERDJump n 0<CR>
nmap <buffer> no :NERDJump o 0<CR>
nmap <buffer> np :NERDJump p 0<CR>
nmap <buffer> nq :NERDJump q 0<CR>
nmap <buffer> nr :NERDJump r 0<CR>
nmap <buffer> ns :NERDJump s 0<CR>
nmap <buffer> nt :NERDJump t 0<CR>
nmap <buffer> nu :NERDJump u 0<CR>
nmap <buffer> nv :NERDJump v 0<CR>
nmap <buffer> nw :NERDJump w 0<CR>
nmap <buffer> nx :NERDJump x 0<CR>
nmap <buffer> ny :NERDJump y 0<CR>
nmap <buffer> nz :NERDJump z 0<CR>

" Search backwards
nmap <buffer> Na :NERDJump a 1<CR>
nmap <buffer> Nb :NERDJump b 1<CR>
nmap <buffer> Nc :NERDJump c 1<CR>
nmap <buffer> Nd :NERDJump d 1<CR>
nmap <buffer> Ne :NERDJump e 1<CR>
nmap <buffer> Nf :NERDJump f 1<CR>
nmap <buffer> Ng :NERDJump g 1<CR>
nmap <buffer> Nh :NERDJump h 1<CR>
nmap <buffer> Ni :NERDJump i 1<CR>
nmap <buffer> Nj :NERDJump j 1<CR>
nmap <buffer> Nk :NERDJump k 1<CR>
nmap <buffer> Nl :NERDJump l 1<CR>
nmap <buffer> Nm :NERDJump m 1<CR>
nmap <buffer> Nn :NERDJump n 1<CR>
nmap <buffer> No :NERDJump o 1<CR>
nmap <buffer> Np :NERDJump p 1<CR>
nmap <buffer> Nq :NERDJump q 1<CR>
nmap <buffer> Nr :NERDJump r 1<CR>
nmap <buffer> Ns :NERDJump s 1<CR>
nmap <buffer> Nt :NERDJump t 1<CR>
nmap <buffer> Nu :NERDJump u 1<CR>
nmap <buffer> Nv :NERDJump v 1<CR>
nmap <buffer> Nw :NERDJump w 1<CR>
nmap <buffer> Nx :NERDJump x 1<CR>
nmap <buffer> Ny :NERDJump y 1<CR>
nmap <buffer> Nz :NERDJump z 1<CR>
