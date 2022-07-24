syntax on
set t_Co=256
set ignorecase
set smartcase
set scrolloff=18
set incsearch
set nohlsearch
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set updatetime=50
set number relativenumber
set nu rnu
set noswapfile
set termguicolors
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


let mapleader=' '

let g:python3_host_prog = '/Users/ryan/.config/nvim/neovim_env'


" " Use ctrl-[hjkl] to select the active split!
" nmap <silent> <c-k> :wincmd k<CR>
" nmap <silent> <c-j> :wincmd j<CR>
" nmap <silent> <c-h> :wincmd h<CR>
" nmap <silent> <c-l> :wincmd l<CR>


" use leader and hjkl to navigate splits
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>o <C-O>
nnoremap <leader>i <C-i>



" bind noh to escape to hide it fast
" nnoremap <esc> :noh<return><esc>

" plugin manager
call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() } }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'tanvirtin/vgit.nvim'
Plug 'styled-components/vim-styled-components'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'TimUntersberger/neogit'
Plug 'tpope/vim-fugitive'

" colorschemes
Plug 'navarasu/onedark.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'nanotech/jellybeans.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'Yazeed1s/minimal.nvim'
call plug#end()

" plugin remapping
" xnoremap <silent>g <cmd>gc

" Telescope mappings
nnoremap <silent> <C-p> <cmd>Telescope find_files theme=dropdown<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>fi <cmd>Telescope quickfix<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>
nnoremap <leader>fr <cmd>Telescope coc references<cr>
nnoremap <leader>fd <cmd>Telescope coc definitions<cr>
nnoremap <leader>ft <cmd>Telescope colorscheme<cr>
nnoremap <leader>gg <cmd>Telescope git_status<cr>
nnoremap <leader>gl <cmd>Telescope git_commits<cr>

" remap git to not conflict with split navigation
nnoremap <leader>gp <Plug>(GitGutterPreviewHunk)
nnoremap <leader>gu <Plug>(GitGutterUndoHunk)
nnoremap <leader>gs <Plug>(GitGutterStageHunk)
xnoremap <leader>gs <Plug>(GitGutterStageHunk)

" " NERDTree
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

nmap <space>e <Cmd>CocCommand explorer<CR>


lua << EOF
require('vgit').setup({
  settings = {
    scene = {
      diff_preference = 'split',
    },
  }
})
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", ".plugins",  ".static", ".public"}
  }
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "python" },

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript", "tsx", "typescript" },


  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- disable = { "tsx", "typescript", "javascript"},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF


let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-prettier',
      \'coc-pairs',
      \'coc-html',
      \'coc-json',
      \'coc-css',
      \'coc-styled-components',
      \'coc-explorer',
      \'coc-pyright']
" coc-vim settings
" TextEdit might fail if hidden is not set.

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif


set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


command! -nargs=0 Tsc :call CocAction('runCommand', 'tsserver.watchBuild')


augroup neovim_terminal
  autocmd!
  " Enter Terminal-mode (insert) automatically
  autocmd TermOpen * startinsert
  " Disables number lines on terminal buffers
  autocmd TermOpen * :set nonumber norelativenumber
  " allows you to use Ctrl-c on terminal window
  autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END




" " colorscheme setup
lua << EOF
require('onedark').setup {
    style = 'darker',
    transparent = true
}
require('onedark').load()
EOF


lua << EOF
require('nightfox').setup({
  options = { transparent = true }
})
EOF


" let g:airline_theme='minimalist'
" let g:airline_theme='nightfox'
" let g:airline_theme='onedark'
" let g:airline_theme='jellybeans'
let g:airline_theme='jellybeans'


colorscheme onedark



nnoremap <leader>si <CMD>CocCommand pyright.organizeimports<CR>


" Cool idea but makes braces laggy
" inoremap {<Enter> {<Enter>}<Esc>O<Tab>

" Because I don't know how to type
command Wq :wq




" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

