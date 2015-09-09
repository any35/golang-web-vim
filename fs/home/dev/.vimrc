set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" custom plugins

Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neocomplete.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'derekwyatt/vim-scala'
Plugin 'easymotion/vim-easymotion'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'garbas/vim-snipmate'
"Plugin 'godlygeek/tabular'
"Plugin 'groenewege/vim-less'
Plugin 'honza/vim-snippets'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'jlanzarotta/bufexplorer'
"Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'mbbill/undotree'
"Plugin 'michaeljsmith/vim-indent-object'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'othree/html5.vim'
"Plugin 'pangloss/vim-javascript'
"Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
"Plugin 'terryma/vim-expand-region'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-haml'
"Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-surround'
"Plugin 'vim-scripts/EasyGrep'
"Plugin 'vim-scripts/YankRing.vim'
"Plugin 'vim-scripts/mru.vim'
"Plugin 'vim-scripts/taglist.vim'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" general customizations
syntax on
set ts=4
set sw=4
set number
set cursorline
set scrolloff=999
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
colorscheme molokai


" plugin customizations

" vim go
" disable open browser after posting snippet
let g:go_play_open_browser = 0
" enable goimports
let g:go_fmt_command = "goimports"
" enable additional highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" vim-airline
set laststatus=2
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'

" tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds' : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


" shortcuts remap
nmap <F2> :tabnew<CR>
nmap <F3> :tabclose<CR>
nmap <F5> :UndotreeToggle<CR>
nmap <F7> :NERDTreeTabsToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <C-Left> :tabprevious<CR>
nmap <C-Right> :tabnext<CR>

" show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)
" show type info for the word under your cursor
au FileType go nmap <Leader>gi <Plug>(go-info)
" open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" run Go commands
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>i <Plug>(go-install)
" open the definition/declaration in a new vertical, horizontal or tab for the
" word under your cursor
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

"==================================================================
" Plugin settings
" =================================================================

"-----------------delimitMate-------------------------------------

"-----------------neocomplete------------------------------------
" neocomplete
let g:neocomplete#enable_at_startup = 1


"----------------easymotion---------------------------------------
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1



