let mapleader = ','

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'lervag/vimtex'
Plug 'terryma/vim-smooth-scroll'
Plug 'jiangmiao/auto-pairs'
Plug 'xuhdev/vim-latex-live-preview'


" http://github.com/ycm-core/YouCompleteMe
" http://derekmolloy.ie/hello-world-introduction-to-cmake
Plug 'Valloric/YouCompleteMe'

call plug#end()

colorscheme gruvbox
set background=dark

" From 'Mastering Vim Quickly', pg 37
set showcmd
set showmode
set hidden
set noerrorbells
set visualbell
set confirm

" Search options
set incsearch
set ignorecase
set smartcase

" Stop scrolling with 3 lines above / below cursor
set scrolloff=3

" Status bar
set laststatus=2
set statusline=%F%m%r%h%w%=(line\ %l/%L,\ col\ %c)

" Swp file management
set directory=$HOME/.vim/swp/

" Persistant undo record
set undofile
set undodir=$HOME/.vim/undodir

" LaTeX settings
let g:tex_flavour='xelatex'
let g:vimtex_view_method='general'
let g:vimtex_view_automatic=1
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_latexmk_continuous=1
let g:livepreview_previewer = 'zathura'

" Make YCM compatible with UltiSnips using supertab
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Better key bindings for UltiSnips expand trigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" NerdTree config
nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1

set tabstop=4
set shiftwidth=4
set expandtab

set number relativenumber
set nu rnu

" Search results appear in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

" Cycling through buffers
map <C-K> :bprev<CR>
map <C-J> :bnext<CR>

" Smooth-scroll settings
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 4, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 4, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 4, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 4, 3)<CR>

" Copy to system clipboard
set clipboard=unnamedplus

" Remove all trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Call function for previous whitepsace command
command! TrimWhitespace call TrimWhitespace()

:noremap <Leader>5 :call TrimWhitespace()<CR>
