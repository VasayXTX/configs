scriptencoding utf-8
set encoding=utf-8

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


" Converting tabs to spaces
" http://vim.wikia.com/wiki/Converting_tabs_to_spaces
set expandtab       " Insert space characters whenever tab key is pressed
set tabstop=4       " Number of space characters that will
                    " be inserted when the tab key is pressed
set shiftwidth=4    " Number of space characters inserted for indentation
set smarttab

" Considering with https://github.com/airbnb/javascript#whitespace
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

autocmd Filetype html setlocal ts=2 sts=2 sw=2

autocmd BufNewFile,BufRead *.jade set filetype=jade
autocmd Filetype jade setlocal ts=2 sts=2 sw=2

autocmd BufNewFile,BufRead *.less set filetype=less
autocmd Filetype less setlocal ts=2 sts=2 sw=2

syntax enable

" Default text encoding
set termencoding=utf-8
" Highlight column number

set et
set ai " Auto-identing"
set wrap " Wrap lines visualy"
set cin

set showmatch
set hlsearch
set incsearch
set ignorecase

set number " always show line numbers

" Don't make backups and swapfiles
set nobackup
set noswapfile

" Highlight trailing whitespaces
" http://vim.wikia.com/wiki/VimTip396#Using_the_list_and_listchars_options
set list
set listchars=tab:▷⋅,trail:⋅,extends:#,nbsp:⋅

" Automatically remove all trailing whitespaces
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * :%s/\s\+$//e

set pastetoggle=<F2>

" Navigation between windows
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-h> <C-w><C-h>
noremap <C-l> <C-w><C-l>

" Hardcore mode"
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Recognize .md as markdown"
au BufRead,BufNewFile *.md set filetype=markdown

" Support vim commands for russian symbols
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Use jk to navigate in autocompletion
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

set tags=./tags;/
" Open the definition in a vertical split
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" For gvim
if has("gui_running") && has("gui_gtk2")
    set guioptions-=m  " remove menu bar
    set guioptions-=T  " remove toolbar
    set guioptions-=r  " remove right-hand scroll bar
    set guioptions-=L  " remove left-hand scroll bar
endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" --------- Copy/Paste and select operations ---------

" CTRL-X and SHIFT-Del are Cut
noremap <C-X>   "+x
noremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
noremap <C-C>      "+y
noremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
noremap <C-V>           "+gP
noremap <S-Insert>      "+gP

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert>     <C-V>
vmap <S-Insert>     <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>       <C-V>

" CTRL-a - select all
nmap <C-a> ggVG

