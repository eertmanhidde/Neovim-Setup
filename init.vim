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
set listchars=tab:\|\
set list
set syntax
set lazyredraw
set ttyfast
set relativenumber
" SETS - END

" PLUGIN - START
call plug#begin('~/.vim/plugged')
  " colorscheme
  Plug 'joshdick/onedark.vim'

  " Navigation within tmux
  Plug 'christoomey/vim-tmux-navigator'

  " for language servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " fuzzy File finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'tpope/vim-rails'

  Plug 'itchyny/vim-gitbranch'

  " For svelte support
  Plug 'evanleck/vim-svelte', {'branch': 'main'}

  " Twig
  Plug 'nelsyeung/twig.vim'

  " emmet snippets
  Plug 'mattn/emmet-vim'

  " for updating the closing tag when editing an open tag
  Plug 'AndrewRadev/tagalong.vim'

  " linting
  Plug 'editorconfig/editorconfig-vim'

  " for sending all my information to Bill Gates
  Plug 'wakatime/vim-wakatime'

  " stylizes the status line at the bottom
  Plug 'itchyny/lightline.vim'

  " This will underline all matching words that your cursor is currently on
  Plug 'itchyny/vim-cursorword'

  " for commenting
  Plug 'preservim/nerdcommenter'

  " for changing stuff thats wrapped in something
  Plug 'tpope/vim-surround'
  " More godly stuff from our king TPOP
  " This plugins is for converting cases to other cases (eg. kebab-case to
  " camelCase)
  Plug 'tpope/vim-abolish'

  " github stuff
  Plug 'airblade/vim-gitgutter'

  " ranger is a file manager
  Plug 'francoiscabrol/ranger.vim'
  Plug 'kevinhwang91/rnvimr'

  " deleting a buffer without closing the window
  Plug 'rbgrouleff/bclose.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'lifepillar/vim-solarized8'

  " Lazygit integration
  Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
call plug#end()
" PLUGIN - END

syntax on
colorscheme onedark

" LETS
let mapleader = " "
let NERDTreeMapOpenInTab='\r'
let g:user_emmet_expandabbr_key = '<Tab>'
let g:NERDSpaceDelims = 1

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
let g:highlightedyank_highlight_duration = 150
" REMAPS - START
nnoremap <leader>ff :GFiles<CR>
" Convert variables on current line from CamelCase to kebab-case
nnoremap <leader>kc :s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1-\l\2#g
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>F :Ag<CR>
nnoremap <leader>fs :w<CR>
nnoremap <leader>L :! gh pr view --web<CR>
nnoremap <leader>fm :RnvimrToggle<CR>
nnoremap <silent> <leader>lg :LazyGit<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap H gT
nnoremap L gt
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
inoremap jj <ESC>
" REMAPS - END

" prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" FUNCTIONS
fun! TrimWhiteSpace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

function! NERDCommenter_before()
  let g:ft = ''
  if &ft == 'vue'
    g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction

function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" AUTOGROUPS
augroup HIDDE_IS_COOL
  autocmd!
  autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

