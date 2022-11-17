" FOLLOW THA LEADER LEADER LEADER, FOLLOW THA LEADER!
let mapleader = " "

" SETS - START
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set incsearch
set scrolloff=8
set cursorline
set signcolumn=yes
set switchbuf=usetab
set list
set syntax
set lazyredraw
set ttyfast
set relativenumber
set completeopt=menuone,noinsert,noselect
set wildignore=*/node_modules/
" SETS - END
" PLUGIN - START
call plug#begin('~/.vim/plugged')
  " A plugin for visualising indented lines
  Plug 'lukas-reineke/indent-blankline.nvim'

  " Language Server Protocol
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'L3MON4D3/LuaSnip'

  " Debugger
  Plug 'mfussenegger/nvim-dap'
  Plug 'suketa/nvim-dap-ruby'

  " Auto pairs, example: automatically create a closing curly brace
  " when creating an opening curly brace
  Plug 'windwp/nvim-autopairs'

  " Navigation within tmux
  Plug 'christoomey/vim-tmux-navigator'

  " Fuzzy File finder
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'nvim-telescope/telescope-live-grep-args.nvim'

  " Icons for telescope
  Plug 'kyazdani42/nvim-web-devicons'

  " file manager
  Plug 'luukvbaal/nnn.nvim'

  " Mah awesome colorscheme
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'bluz71/vim-moonfly-colors'

  " Provides the branch name for lightline
  Plug 'itchyny/vim-gitbranch'

  " Plugin for showing changed lines, similiar to gitgutter but performing
  " faster
  Plug 'mhinz/vim-signify'

  " emmet snippets
  Plug 'mattn/emmet-vim'

  " for updating the closing tag when editing an open tag
  Plug 'AndrewRadev/tagalong.vim'

  " stylizes the status line at the bottom
  Plug 'itchyny/lightline.vim'

  " This will underline all matching words that your cursor is currently on
  Plug 'itchyny/vim-cursorword'

  " for commenting
  Plug 'numToStr/Comment.nvim'

  " peek in registers
  Plug 'gennaro-tedesco/nvim-peekup'

  " For organizing notes following the zettelkasten method
  Plug 'renerocksai/telekasten.nvim'
  Plug 'renerocksai/calendar-vim' " Used in telekasten to display a calendar for daily notes

  " Improved window managed
  Plug 'beauwilliams/focus.nvim'

  " for changing stuff thats wrapped in something
  Plug 'tpope/vim-surround'
  " More godly stuff from our king TPOP
  " This plugins is for converting cases to other cases (eg. kebab-case to
  " camelCase)
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-unimpaired'

  " Plugin for running tests with VIM
  Plug 'vim-test/vim-test'

  " Highlight yanked area
  Plug 'machakann/vim-highlightedyank'

  " Lazygit integration
  Plug 'kdheepak/lazygit.nvim'

  " Fugitive, a plugin to commmunicate with Git
  " Made by the one and only Tpope himself
  Plug 'tpope/vim-fugitive'

  " Twig
  Plug 'nelsyeung/twig.vim'

  " Snippets!
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

  " Flutter stuf
  Plug 'akinsho/flutter-tools.nvim'

  " Reviewing PR's
  Plug 'pwntester/octo.nvim'
call plug#end()
" PLUGIN - END

syntax on
colorscheme tokyonight-night

highlight HighlightedyankRegion cterm=reverse gui=reverse

" ----------------- Lets - START -------------------


" Use Emmet with tab
let g:user_emmet_expandabbr_key = '<Tab>'

let g:user_emmet_mode='i' " Only use Emmet in insert mode
" Set default Javascript test runner to Jest for vim-test
let g:test#javascript#runner = 'jest'

" Lightline configuration
let g:lightline = {
      \ 'colorscheme': 'moonfly',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }

let g:highlightedyank_highlight_duration = 150

" --------------------- Lets - END ------------------------



" --------------------- REMAPS - NORMAL MODE - START ---------------------

" Saving a file
nnoremap <leader>fs :w<CR>
" Open terminal
nnoremap <leader>tm :ter<CR>
" Source the config!
nnoremap <leader>s :source $MYVIMRC<CR>
" Close all tabs except current tab
nnoremap <leader>qa :tabonly<CR>
" Unloads the current buffer from the buffer list, will fail if changes are
" still present
nnoremap <leader>bd :bd<CR>
" Opens NNN
nnoremap <leader>fm :NnnPicker %:p:h<CR>
" Test the current file with vim-test
nnoremap <leader>tf :TestFile<CR>
" Test the nearest spec with vim-test
nnoremap <leader>tn :TestNearest<CR>
" Opens LazyGit
nnoremap <silent> <leader>lg :LazyGit<CR>
" Bindings for navigating
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap H gT
nnoremap L gt
" Creates erb brackets because I love ERB <3
nnoremap <leader>erb i<%=  %><esc>hhi

" Opens current ticket number in URL
nnoremap <leader>to :!ticket.sh<CR>

" Refresh Widgetbook
nnoremap <silent> <leader>fr :silent !tmux send-keys -t spotta:widgetbook r Enter<CR>

" ---------------------- REMAPS - NORMAL MODE - END ------------------------



" ---------------------- REMAPS - VISUAL MODE - START ----------------------

" Allows you to grep and replace the current visually selected content
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" ---------------------- REMAPS - VISUAL MODE - END ------------------------



" ---------------------- REMAPS - INSERT MODE - START ----------------------

" Escape insert mode with "jj" because that's what superior people do
inoremap jj <ESC>

" ---------------------- REMAPS - INSERT MODE - END ------------------------

" FUNCTIONS
fun! TrimWhiteSpace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

" AUTOGROUPS
augroup HIDDE_IS_COOL
  autocmd!
  autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

