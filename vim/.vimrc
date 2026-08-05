set shell=/bin/zsh

" Key mappings
let mapleader = " "

" https://stackoverflow.com/questions/16137623/setting-the-cursor-to-a-vertical-thin-line-in-vim
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' | 
\   silent execute '!echo -ne "\e[6 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" disable
let g:highlightedyank_highlight_duration = 100
let g:context_enabled = 1
let g:context_add_mappings = 0 "don't add keymaps

let g:polyglot_disabled = ['zig']

" vim plug
call plug#begin()
" code
Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/colorizer'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive' " needed to display git branch in airline
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
Plug 'machakann/vim-highlightedyank'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-highlightedyank'
" themes
Plug 'morhetz/gruvbox'
Plug 'RRethy/vim-illuminate'
"language-stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yaegassy/coc-ruff', {'do': 'yarn install --frozen-lockfile'}
Plug 'yaegassy/coc-ty', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

colorscheme gruvbox
set background=dark


" opts
syntax on
set nohlsearch
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set termguicolors
set foldcolumn=0
set signcolumn=yes
set relativenumber
set number
set timeout timeoutlen=120
set nofoldenable
set ignorecase
set smartcase
"set cursorline
set backspace=indent,eol,start
set clipboard=unnamed
set splitright
set splitbelow
set wrap
set shortmess-=I
set noswapfile
set undofile
set foldlevel=99
set foldlevelstart=99
set fillchars=fold:\ 
set pumheight=10
set pumwidth=50

" mappings
nmap <C-d> <C-d>zz
nmap <C-s> :w<CR>
nmap <leader>qq <ESC>:qa<CR>
nmap <S-l> :bnext<cr>
nmap <S-h> :bprevious<cr>
nmap <leader>bd :bd<CR>
nmap <silent> = :vertical resize +5<CR>
nmap <silent> - :vertical resize -5<CR>
nmap <silent> <c-q> :close<CR>
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>
imap jk <ESC>
imap <C-s> <ESC>:w<CR>
imap <C-c> <ESC>
vnoremap > >gv
vnoremap < <gv


" Set signcolumn and foldcolumn to match Normal highlight group
highlight FoldColumn guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE

" nerdtree
 nmap <leader>e :NERDTreeToggle<CR>
 nmap <leader>fe :NERDTreeFind<CR>
 let g:NERDTreeMapActivateNode = 'l'
 let g:NERDTreeMapCloseDir = 'h'
 let g:NERDTreeDirArrowExpandable = '+'
 let g:NERDTreeDirArrowCollapsible = '-'
 let g:NERDTreeWinPos = 'right'

" netrw
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"nmap <leader>e :Lexplore<CR>
"nmap <leader>fe :Lexplore %:p:h<CR>

augroup netrw_mappings
  autocmd!
  autocmd FileType netrw nmap <buffer> l <CR>
  autocmd FileType netrw nmap <buffer> h -
  autocmd FileType netrw nmap <buffer> <C-c> :Lexplore<CR>
augroup END

"
nmap <leader>cw :StripWhitespace<CR>

" indentLine
let g:indentLine_char = '│'

" whitespace visualization
highlight link ExtraWhitespace IncSearch


" airline
let g:vim_airline_theme='tokyonight'
let g:airline#extensions#ale#enabled = 0 " no warnings in the statusline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_section_y = airline#section#create(['%{&readonly ? "RO" : ""}', '%{&modified ? "+" : ""}'])
let g:airline_section_z = airline#section#create(['%3p%%', ':%l/%L'])

" fzf
nmap <leader>rg :Rg<CR>
nmap <leader>f :Files<CR>
nmap <leader>fr :Files ~<CR>

" changes the pop up color
highlight Pmenu ctermbg=236 ctermfg=255 guibg=#2e2e2e guifg=#ffffff


" Coc
set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> <leader>d :call ShowDocumentation()<CR>
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    echo "No hover provider"
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>cr <Plug>(coc-rename)
xmap <leader>fo  <Plug>(coc-format-selected)
nmap <leader>fo  :Format<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-cursor)

" Remap keys for apply code actions affect whole buffer
" nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
 nnoremap <silent><nowait> <space>sd  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>cs  :<C-u>CocList outline<cr>
" Manage extensions
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Search workspace symbols
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" loop over placeholders
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" symbol highlighting
" coc-highlight
" autocmd CursorHold * silent call CocActionAsync('highlight')
