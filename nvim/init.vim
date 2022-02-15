set nu
set relativenumber
set ai
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set encoding=UTF-8
syntax enable


" Vim-Plug
call plug#begin()

" Beauty
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'kristijanhusak/vim-hybrid-material'

" Configuration
Plug 'editorconfig/editorconfig-vim'

" Formatter
Plug 'google/vim-maktaba' | Plug 'google/vim-codefmt' | Plug 'google/vim-glaive'

" Productivity
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround' | Plug 'tpope/vim-repeat'
Plug 'mg979/vim-visual-multi'

" Web
Plug 'ap/vim-css-color'

call plug#end()


" codefmt config
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END


" Color Scheme
colorscheme hybrid_reverse
let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:airline_theme = "hybrid"

if (has("termguicolors"))
	set termguicolors
endif


" Undofile
if has('persistent_undo')
	set undodir=$HOME/.local/.vimundo/
	set undofile
endif


" Key Mapping

" NerdTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

