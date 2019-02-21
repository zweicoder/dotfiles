" -*- mode: vimrc -*-
"vim: ft=vim

" dotspacevim/auto-install {{{
" Automatic installation of spacevim.

if empty(glob('~/.vim/autoload/spacevim.vim'))
    silent !curl -sSfLo ~/.vim/autoload/spacevim.vim --create-dirs
          \ https://raw.githubusercontent.com/ctjhoa/spacevim/master/autoload/spacevim.vim
endif

" }}}

" dotspacevim/init {{{
" This code is called at the very startup of Spacevim initialization
" before layers configuration.
" You should not put any user code in there besides modifying the variable
" values."
" IMPORTANT: For the moment, any changes in plugins or layers needs
" a vim restart and :PlugInstall

  let g:dotspacevim_distribution_mode = 1

  let g:dotspacevim_configuration_layers = [
  \  'core/.*',
  \  'git',
  \  'syntax-checking'
  \]

  let g:dotspacevim_additional_plugins = ['morhetz/gruvbox', 'pangloss/vim-javascript']
  " You can also pass vim plug options like this: [{ 'name': 'Valloric/YouCompleteMe', 'option': {'do': './install.py'}}]

  let g:dotspacevim_excluded_plugins = []

  let g:dotspacevim_escape_key_sequence = 'fd'
" }}}

" dotspacevim/user-init {{{
" Initialization for user code.
" It is compute immediately after `dotspacemacs/init', before layer
" configuration executes.
" This function is mostly useful for variables that need to be set
" before plugins are loaded. If you are unsure, you should try in setting
" them in `dotspacevim/user-config' first."

  let mapleader = ' '
  let g:leaderGuide_vertical = 0

" }}}

call spacevim#bootstrap()

" dotspacevim/user-config {{{
" Configuration for user code.
" This is computed at the very end of Spacevim initialization after
" layers configuration.
" This is the place where most of your configurations should be done.
" Unless it is explicitly specified that
" a variable should be set before a plugin is loaded,
" you should place your code here."

" ==============================
" => Visuals
" ===============================
  set background=dark
  colorscheme gruvbox
  set relativenumber " Show relative line numbers - much more helpful
  set number " Hybrid mode that also shows current line number
  set ignorecase
  set smartcase
  set incsearch
  set hlsearch

" ==============================
" => Mappings
" ===============================
  " Map Ctrl-Backspace to delete the previous word in insert mode.
  imap <C-h> <C-W> 

  " Map Ctrl+Shift+[Down/Up] to move lines (ctrl + shift + [jk] has issues)
  nnoremap <C-S-Down> :m .+1<CR>==
  nnoremap <C-S-Up> :m .-2<CR>==
  inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
  inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
  vnoremap <C-S-Down> :m '>+1<CR>gv=gv
  vnoremap <C-S-Up> :m '<-2<CR>gv=gv
  inoremap df <Esc>
  inoremap fd <Esc>
  " Prevents us from moving irregularly for soft-wrapped lines
  nnoremap <expr> j v:count ? 'j' : 'gj'
  nnoremap <expr> k v:count ? 'k' : 'gk'
  " move to beginning/end of line
  noremap B ^
  noremap E $
  " highlight last inserted text
  nnoremap gV `[v`]
  " Map Enter to insert newline without entering insert
  nmap <CR> o<Esc>

" ==============================
" => Plugin Settings
" ===============================
function! s:spacevim_bind_plug(map, binding, name, value)
  if a:map ==# 'map' && maparg('<Leader>' . a:binding, '') ==# ''
    let l:map = 'map'
  elseif a:map ==# 'nmap' && maparg('<Leader>' . a:binding, 'n') ==# ''
    let l:map = 'nmap'
  elseif a:map ==# 'vmap' && maparg('<Leader>' . a:binding, 'v') ==# ''
    let l:map = 'vmap'
  else
    let l:map = ''
  endif

  if l:map !=# ''
    execute l:map . ' <silent> <SID>' . a:name . '# <Plug>' . a:value
    execute a:map . ' <Leader>' . a:binding . ' <SID>' . a:name . '#'
  endif
endfunction

call s:spacevim_bind_plug('nmap', 'j', 'easymotion-bd-f', '(easymotion-bd-f)')
call s:spacevim_bind_plug('map', 'J', 'easymotion-sn', '(easymotion-sn)')
call s:spacevim_bind_plug('omap', 'J', 'easymotion-tn', '(easymotion-tn)')

" ==============================
" => Language specific Settings
" ===============================
set smarttab
set cindent
filetype plugin indent on
set shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html       setlocal shiftwidth=2 tabstop=2
autocmd FileType python     setlocal shiftwidth=4 softtabstop=4 expandtab
" }}}
