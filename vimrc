" Set standard file encoding
set encoding=utf8

" Set 256 colors
set t_Co=256

" No special per file vim override configs 
set nomodeline 

" Stop word wrapping
set nowrap
" Except... on Markdown. That's good stuff
autocmd FileType markdown setlocal wrap

" Adjust system undo levels
set undolevels=100

" Use system clipboard
set clipboard=unnamed

" Set text width
set textwidth=80

" Set tab width and convert tabs to spaces
set tabstop=4  
set softtabstop=4	
set shiftwidth=4
set expandtab
set shiftround
set autoindent

" Don't let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells

" Number gutter with relative line numbers
" Relative lines encourage smarter movements in vim
set number
set relativenumber

" Use search highlighting
set hlsearch

" Space above/beside cursor from screen edges
set scrolloff=1
set sidescrolloff=5

" Disable mouse support
set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

call plug#begin('~/.local/share/nvim/plugged')

" Required
Plug 'Shougo/unite.vim'

" Visuals
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'

" Navigating Project Files and Enable fzf
Plug 'mhinz/vim-grepper'
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
    let g:fzf_layout = { "window": "silent botright 16split enew" }
    let g:fzf_commits_log_options = '--graph --color=always
      \ --format="%C(yellow)%h%C(red)%d%C(reset)
      \ - %C(bold green)(%ar)%C(reset) %s %C(blue){%an}%C(reset)"'
    nnoremap <silent> <Space><Space> :Files<CR>
    nnoremap <silent> <Space>-       :Files <C-r>=expand("%:h")<CR>/<CR>
    nnoremap <silent> <Space>'       :Marks<CR>
    nnoremap <silent> <Space>,       :Buffers<CR>
    nnoremap <silent> <Space>]       :Tags<CR>
    nnoremap <silent> <Space>b]      :BTags<CR>
    nnoremap <silent> <Space>c       :Commits<CR>
    nnoremap <silent> <Space>bc      :BCommits<CR>
    nnoremap <silent> <Space>h       :Helptags<CR>
    nnoremap <silent> <Space>s       :Snippets<CR>
    nnoremap          \f             :Rg<Space>
    nnoremap <silent> \l             :Lines<CR>
    nnoremap <silent> \bl            :BLines<CR>
    " ~/dotfiles/vim/after/plugin/fzf.vim - customizations
Plug 'pbogut/fzf-mru.vim'
    nnoremap <silent> <Space>m :FZFMru<CR>

" Code Editing
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
Plug 'w0rp/ale'

" Movement
Plug 'justinmk/vim-sneak'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Configuration

" Theme: Dracula
" Include background fill colors
let g:dracula_italic = 0 
" Set colorscheme
colorscheme dracula
" Override background color
highlight Normal ctermbg=None 

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

" Leader
let mapleader="\<SPACE>"

" Return to last opened file
nmap <Leader><Leader> <c-^>

" Adding empty lines
nnoremap <Leader>[  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap <Leader>]  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Moving current line
nnoremap <Leader>m[  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <Leader>m]  :<c-u>execute 'move +'. v:count1<cr>

" Arrow keys resize pane
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" Disable arrow keys in insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Grepper
nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

" File Buffer
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>

" Fuzzy Finder
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

" vimfiler
map ` :VimFiler -explorer<CR>
map ~ :VimFilerCurrentDir -explorer -find<CR>

" sneak
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
