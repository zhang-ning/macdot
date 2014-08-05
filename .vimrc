set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'L9'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'endel/vim-github-colorscheme'
Bundle 'Shutnik/jshint2.vim'
Bundle 'mattn/emmet-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
"ultisnips
Bundle 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Bundle 'groenewege/vim-less'
Bundle 'plasticboy/vim-markdown'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'bling/vim-airline'
Bundle "godlygeek/tabular"
Bundle "ervandew/supertab"
Bundle 'marijnh/tern_for_vim'
Bundle "magic-dot-files/TagHighlight"
Bundle "edkolev/tmuxline.vim"
Bundle "majutsushi/tagbar"
Bundle "Valloric/YouCompleteMe"
Bundle 'cakebaker/scss-syntax.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
set clipboard=unnamed
syntax enable
syntax on
set background=dark
colorscheme solarized

"智能对齐方式
set smartindent
set cursorline cursorcolumn
set nobackup
set noswapfile
let mapleader=','

""自动缩进
set autoindent
set textwidth=300
set t_Co=256
set number
set hidden
set showmatch
set autoread
set title
set ruler
set incsearch
set hls
set laststatus=2
set encoding=utf-8
set wildmenu
set tags+=./tags
set ignorecase
set t_Co=256
set linespace=4
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,trail:␣
set list

nmap <leader>f :NERDTreeToggle <cr>
let g:ctrlp_map = '<leader>p'

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"Tabularize
if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:<CR>
  vmap <leader>a: :Tabularize /:<CR>
endif

"line setting
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

set guifont=Source\ Code\ Pro\ for\ Powerline:h14
let g:airline_powerline_fonts = 1

"UltiSnips setting
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"""""""""""syntastic"""""
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '☢ '

""""""""""""YCM""""""""""""""'
"change you complete me plugin default mappings"{{{
""refer to this blog post :http://0x3f.org/blog/make-youcompleteme-ultisnips-compatible/
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-Tab>'

nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>
noremap <silent><Leader>/ :nohls<CR>

"easy resize window resize with arrowkey  from www.vimbits.com
noremap <s-j> <c-w>+
noremap <s-k> <c-w>-
noremap <s-h> <c-w><
noremap <s-l> <c-w>>

"Resize Vsplits on window resize
au VimResized * exe "normal! \<c-w>="
nmap <leader>v :tabedit $MYVIMRC<CR>

noremap <leader>5 :%s/\s\+$//e <cr>


if has("autocmd")
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab

  " autocmd bufwritepost .vimrc source $MYVIMRC
  "
  " jsbeautify.vim
  autocmd FileType javascript noremap <buffer>  <c-b> :call JsBeautify()<cr>
  " for html
  autocmd FileType html noremap <buffer> <c-b> :call HtmlBeautify()<cr>
  " for css or scss
  autocmd FileType css noremap <buffer> <c-b> :call CSSBeautify()<cr>

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif
