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
set nowrap

let g:python3_host_prog = '/Users/ryan/.config/nvim/neovim_env/bin/python'

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set mouse=a

set laststatus=3

let mapleader=' '



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

" open current buffer in smerge

nnoremap <leader>sm <cmd>!smerge log %<cr>
nnoremap <leader>sl :execute ":!smerge search 'file:% line:"..line('.').."-"..line('.').."'"<cr>


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
Plug 'nvim-treesitter/nvim-treesitter-context'
"Plug 'https://github.com/airblade/vim-gitgutter.git'
" Plug 'tanvirtin/vgit.nvim'
Plug 'styled-components/vim-styled-components'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'TimUntersberger/neogit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'ellisonleao/glow.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'mechatroner/rainbow_csv'

" Colorscheme switcher
Plug 'vimpostor/vim-lumen'

" colorschemes
Plug 'navarasu/onedark.nvim'
Plug 'nanotech/jellybeans.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'Yazeed1s/minimal.nvim'
Plug 'savq/melange'
Plug 'fcpg/vim-farout'
Plug 'RRethy/nvim-base16'
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'rose-pine/neovim', {'as': 'rose-pine'}
Plug 'kaiuri/nvim-juliana'

call plug#end()

" plugin remapping
" xnoremap <silent>g <cmd>gc

" Telescope mappings
nnoremap <silent> <C-p> <cmd>Telescope find_files theme=dropdown<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fp <cmd>Telescope commands<cr>
nnoremap <leader>fi <cmd>Telescope quickfix<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>
nnoremap <leader>fr <cmd>Telescope coc references<cr>
nnoremap <leader>fd <cmd>Telescope coc definitions<cr>
nnoremap <leader>ft <cmd>Telescope colorscheme<cr>
" nnoremap <leader>gg <cmd>Telescope git_status<cr>
nnoremap <leader>gl <cmd>Telescope git_commits<cr>

" " remap git to not conflict with split navigation
" nnoremap <leader>gp <Plug>(GitGutterPreviewHunk)
" nnoremap <leader>gu <Plug>(GitGutterUndoHunk)
" nnoremap <leader>gs <Plug>(GitGutterStageHunk)
" xnoremap <leader>gs <Plug>(GitGutterStageHunk)

" remap git to not conflict with split navigation
" nnoremap <leader>gp <cmd>VGit buffer_hunk_preview<cr>
" nnoremap <leader>gs <cmd>VGit buffer_hunk_stage<cr>
" nnoremap <leader>gu <cmd>VGit buffer_unstage<cr>

" nmap <silent> [c <cmd>VGit hunk_up<cr>
" nmap <silent> ]c <cmd>VGit hunk_down<cr>

nnoremap <leader>gg <cmd>vertical Git<cr>
command G :vertical Git

lua << EOF
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
        },
        -- Patterns for specific filetypes
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        tex = {
            'chapter',
            'section',
            'subsection',
            'subsubsection',
        },
        rust = {
            'impl_item',
            'struct',
            'enum',
        },
        scala = {
            'object_definition',
        },
        vhdl = {
            'process_statement',
            'architecture_body',
            'entity_declaration',
        },
        markdown = {
            'section',
        },
        elixir = {
            'anonymous_function',
            'arguments',
            'block',
            'do_block',
            'list',
            'map',
            'tuple',
            'quoted_content',
        },
        json = {
            'pair',
        },
        yaml = {
            'block_mapping_pair',
        },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
}
EOF


" " NERDTree
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

nmap <leader>e <Cmd>CocCommand explorer --width 35<CR>


lua << EOF
-- require('vgit').setup({
--   settings = {
--     scene = {
--       diff_preference = 'split',
--     },
--     live_blame = {
--       enabled = false,
--     },
--     authorship_code_lens = {
--       enabled = false,
--     },
--   }
-- })
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", ".plugins",  ".static", ".public", "env"},
    path_display = { truncate }
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
" set cmdheight=2

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

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ CheckBackspace() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction


" inoremap <silent><expr> <TAB>
"   \ coc#pum#visible() ? coc#_select_confirm() :
"   \ coc#expandableOrJumpable() ?
"   \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ coc#refresh()

"     function! s:check_back_space() abort
"       let col = col('.') - 1
"       return !col || getline('.')[col - 1]  =~# '\s'
"     endfunction

"     let g:coc_snippet_next = '<tab>'

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'



" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :vsp<CR><Plug>(coc-definition)
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
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


command! -nargs=0 Tsc :call CocAction('runCommand', 'tsserver.watchBuild')


augroup neovim_terminal
  autocmd!
  " Enter Terminal-mode (insert) automatically
  " autocmd TermOpen * startinsert
  " Disables number lines on terminal buffers
  autocmd TermOpen * :set nonumber norelativenumber
  " allows you to use Ctrl-c on terminal window
  autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END

tnoremap <S-Esc> <C-\><C-n>
" tnoremap <Esc><Esc> <C-\><C-n>


let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_autoclose=1

" Set floaterm window's background to black
" hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
" hi FloatermBorder guibg=black guifg=cyan

nnoremap <leader>tt <cmd>FloatermToggle<cr>
nnoremap <leader>tg <cmd>FloatermNew lazygit<cr>
nnoremap <leader>ts <cmd>FloatermNew spt --tick-rate 16<cr>
nnoremap <leader>tn <cmd>FloatermNext<cr>
nnoremap <leader>tx <cmd>FloatermKill<cr>


" colorscheme setup
" https://github.com/navarasu/onedark.nvim
" lua << EOF
"  require('onedark').setup {
"      style = 'warm',
"      transparent = true,
"      colors = {
"        -- purple = "#c678dd",
"        purple = "#9578b0",
"        fg = "#bfb1a3",
"        cyan = "#5eaba1",
"        blue = "#689bc4",
"        yellow = "#c98f59",
"        orange = "#d6b569",
"      },
"  }
"  require('onedark').load()
" EOF
" let g:airline_theme='angr'
" let g:irline_theme='distinguished'
" let g:airline_theme='jet'
" let g:airline_theme='base16'
" let g:airline_theme='onedark'
" colorscheme base16-solarized-light
" colorscheme base16-onedark

let g:airline_theme='minimalist'
" set fillchars+=vert:\ "

" au User LumenLight set background=light
" au User LumenLight colorscheme base16-solarized-light
au User LumenLight colorscheme base16-humanoid-light
au User LumenLight let g:airline_theme='minimalist'

" au User LumenDark set background=dark
au User LumenDark colorscheme base16-twilight
au User LumenDark let g:airline_theme='minimalist'

" let g:airline_section_z='%p%%%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#%#__accent_bold#%{g:airline_symbols.colnr}%v%#__restore__#'
"let g:airline_section_z='%L%{g:airline_symbols.maxlinenr}'

" lua << EOF
" require('nightfox').setup({
"   options = { transparent = true }
" })
" EOF


"" lua << EOF
"" require('base16-colorscheme').setup({
""   base00 = '#16161D'
"" })
"" EOF
""


" let g:airline_theme='minimalist'
" let g:airline_theme='nightfox'
" let g:airline_theme='jellybeans'
" let g:airline_theme='farout'

" let g:airline_theme='base16'
" colorscheme base16-twilight

" let g:airline_theme='gruvbox'
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_transparent_bg='1'
" let g:gruvbox_sign_column='bg0'
" colorscheme gruvbox


" let g:airline_theme='farout'
" colorscheme farout

" autocmd VimEnter * hi Normal ctermbg=none

" colorscheme base16-default-dark
" colorscheme farout

autocmd BufNewFile,BufRead *.csv   set filetype=csv
autocmd BufNewFile,BufRead *.csv   set laststatus=3




nnoremap <leader>si <CMD>CocCommand pyright.organizeimports<CR>


" Cool idea but makes braces laggy
" inoremap {<Enter> {<Enter>}<Esc>O<Tab>

" Because I don't know how to type
command Wq :wq
command W :w
nnoremap <leader>q <cmd>q<cr>



augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc
augroup END

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

set laststatus=3

