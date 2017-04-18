" Autoreload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
    source ~/.vim_runtime/my_configs.vim
catch
endtry

" Change cwd upon entering different buffer
autocmd BufEnter * lcd %:p:h

" ==============================
" => Visuals
" ===============================
set relativenumber " Show relative line numbers - much more helpful
set number " Hybrid mode that also shows current line number

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

set showcmd " Show currently inputted keystrokes
nnoremap <silent> <esc><esc> :noh<CR>

" File Folding
:autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

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
" save session - reopen these set of windows with `vim -S ~/.vim_session`
" if used extensively consider doing stuff like $PWD/.vim_session
nnoremap <leader>s :mksession! ~/.vim_session<CR>
