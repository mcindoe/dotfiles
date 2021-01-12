let mapleader = ','

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'lervag/vimtex'
Plug 'terryma/vim-smooth-scroll'
Plug 'jiangmiao/auto-pairs'
Plug 'xuhdev/vim-latex-live-preview'
" Plug 'dense-analysis/ale'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'fisadev/vim-isort'

" http://github.com/ycm-core/YouCompleteMe
" http://derekmolloy.ie/hello-world-introduction-to-cmake
Plug 'Valloric/YouCompleteMe'

call plug#end()

" From 'Mastering Vim Quickly', pg 37
set nocompatible " Use Vim settings rather than Vi settings
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set hidden
set noerrorbells
set visualbell
set confirm " Display a confirmation dialog when closing an unsaved file
set tabstop=4
set shiftwidth=4
set expandtab
" set nowrap " Don't wrap lines

" Search options - also from Mastering Vim Quickly
set incsearch
set ignorecase
set smartcase
set encoding=utf-8 " Use an encoding that supports Unicode
set linebreak " Wrap lines at convenient points, avoid wrapping a line in the middle of a word

" Status bar
set laststatus=2
set statusline=%F%m%r%h%w%=(line\ %l/%L,\ col\ %c)

set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
" highlight Normal ctermbg=None

" Open netrw files in the buffer not used by netrw
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

set scrolloff=3 " Set minimum number of lines present at top or bottom of file when scrolling
set sidescrolloff=5 " Similar to the above but for columns

" Swap file management
set directory=$HOME/.vim/swp//

" Persistant undo record
set undofile
set undodir=$HOME/.vim/undodir

" LaTeX settings
" let g:tex_flavour='xelatex'
" let g:vimtex_view_method='general'
" let g:vimtex_view_automatic=1
" set conceallevel=1
" let g:tex_conceal='abdmg'
" let g:vimtex_latexmk_continuous=1
" let g:livepreview_previewer = 'zathura'

" Make YCM compatible with UltiSnips using supertab
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_confirm_extra_conf=1
let g:ycm_always_populate_location_list=1
nnoremap <Leader>f :YcmCompleter FixIt<Enter>

" YCM automatic help - found it a bit invasive so disabled
" let g:ycm_auto_trigger = 1

" Better key bindings for UltiSnips expand trigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" NerdTree config
nnoremap <Leader>t :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1

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

" Define a function to remove all trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Map TrimWhiteSpace() function to a key binding
command! TrimWhitespace call TrimWhitespace()
:noremap <Leader>t :call TrimWhitespace()<CR>

" Map Caps Lock key to escape key when entering vim; reverse when leaving vim
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Set column at specified character count, e.g. Python 80-character line
" suggestion
" set colorcolumn=73,80
set colorcolumn=120

" Black config
let g:black_linelength=79
nnoremap <Leader>b :Black<CR>

" vim-isort config
" let g:multi_line_output=7
" let g:force_single_line=1
nnoremap <Leader>s :Isort<CR>
let g:vim_isort_config_overrides = {'force_single_line': 1}

" disable auto-detection of virtualenvironments
let g:ale_virtualenv_dir_names = []
