
" Plugin Settings
"---------------------------------------------------------

if dein#tap('denite.nvim')
	nnoremap <silent><LocalLeader>r :<C-u>Denite -resume -refresh -no-start-filter<CR>
	nnoremap <silent><LocalLeader>f :<C-u>Denite file/rec<CR>
	nnoremap <silent><LocalLeader>b :<C-u>Denite buffer file_mru -default-action=switch<CR>
	nnoremap <silent><LocalLeader>d :<C-u>Denite directory_rec directory_mru -default-action=cd<CR>
	nnoremap <silent><LocalLeader>v :<C-u>Denite neoyank -buffer-name=register<CR>
	xnoremap <silent><LocalLeader>v :<C-u>Denite neoyank -buffer-name=register -default-action=replace<CR>
	nnoremap <silent><LocalLeader>l :<C-u>Denite location_list -buffer-name=list -no-start-filter<CR>
	nnoremap <silent><LocalLeader>q :<C-u>Denite quickfix -buffer-name=list -no-start-filter<CR>
	nnoremap <silent><LocalLeader>n :<C-u>Denite dein<CR>
	nnoremap <silent><LocalLeader>g :<C-u>Denite grep -no-start-filter<CR>
	nnoremap <silent><LocalLeader>j :<C-u>Denite jump change file/point<CR>
	nnoremap <silent><LocalLeader>u :<C-u>Denite junkfile:new junkfile -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>o :<C-u>Denite outline<CR>
	nnoremap <silent><LocalLeader>s :<C-u>Denite session -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>t :<C-u>Denite tag<CR>
	nnoremap <silent><LocalLeader>p :<C-u>Denite jump<CR>
	nnoremap <silent><LocalLeader>h :<C-u>Denite help<CR>
	nnoremap <silent><LocalLeader>m :<C-u>Denite file/rec -buffer-name=memo -path=~/docs/books<CR>
	" nnoremap <silent><LocalLeader>m :<C-u>Denite mpc -buffer-name=mpc<CR>
	nnoremap <silent><LocalLeader>z :<C-u>Denite z -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>; :<C-u>Denite command command_history<CR>
	nnoremap <silent><LocalLeader>/ :<C-u>Denite line<CR>
	nnoremap <silent><LocalLeader>* :<C-u>DeniteCursorWord line<CR>

	" chemzqm/denite-git
	nnoremap <silent> <Leader>gl :<C-u>Denite gitlog:all -no-start-filter<CR>
	nnoremap <silent> <Leader>gs :<C-u>Denite gitstatus -no-start-filter<CR>
	nnoremap <silent> <Leader>gc :<C-u>Denite gitbranch -no-start-filter<CR>

	" Open Denite with word under cursor or selection
	nnoremap <silent> <Leader>gt :DeniteCursorWord tag:include -buffer-name=tag -immediately<CR>
	nnoremap <silent> <Leader>gf :DeniteCursorWord file/rec<CR>
	nnoremap <silent> <Leader>gg :DeniteCursorWord grep -buffer-name=search<CR>
	vnoremap <silent> <Leader>gg
		\ :<C-u>call <SID>get_selection('/')<CR>
		\ :execute 'Denite -buffer-name=search grep:::'.@/<CR><CR>

	function! s:get_selection(cmdtype)
		let temp = @s
		normal! gv"sy
		let @/ = substitute(escape(@s, '\' . a:cmdtype), '\n', '\\n', 'g')
		let @s = temp
	endfunction
endif

if dein#tap('defx.nvim')
	nnoremap <silent> <LocalLeader>e
		\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
	nnoremap <silent> <LocalLeader>a
		\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>
endif

if dein#tap('vim-denite-z')
	command! -nargs=+ -complete=file Z
		\ call denite#start([{'name': 'z', 'args': [<q-args>], {'immediately': 1}}])
endif

if dein#tap('vista.vim')
	nnoremap <silent> <Leader>t :<C-u>Vista<CR>
	nnoremap <silent> <Leader>a :<C-u>Vista show<CR>
endif

if dein#tap('neosnippet.vim')
	imap <expr><C-o> neosnippet#expandable_or_jumpable()
		\ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<ESC>o"
	smap <silent>L     <Plug>(neosnippet_jump_or_expand)
	xmap <silent>L     <Plug>(neosnippet_expand_target)
	" inoremap <silent><ESC>  <ESC>:NeoSnippetClearMarkers<CR>
	snoremap <silent><ESC>  <ESC>:NeoSnippetClearMarkers<CR>
endif

if dein#tap('emmet-vim')
	autocmd user_events FileType html,css,javascript,javascriptreact
		\ EmmetInstall
		\ | imap <buffer> <C-Return> <Plug>(emmet-expand-abbr)
endif

if dein#tap('vim-sandwich')
	nmap <silent> sa <Plug>(operator-sandwich-add)
	xmap <silent> sa <Plug>(operator-sandwich-add)
	omap <silent> sa <Plug>(operator-sandwich-g@)
	nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	xmap <silent> sd <Plug>(operator-sandwich-delete)
	nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	xmap <silent> sr <Plug>(operator-sandwich-replace)
	nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	omap ib <Plug>(textobj-sandwich-auto-i)
	xmap ib <Plug>(textobj-sandwich-auto-i)
	omap ab <Plug>(textobj-sandwich-auto-a)
	xmap ab <Plug>(textobj-sandwich-auto-a)
	omap is <Plug>(textobj-sandwich-query-i)
	xmap is <Plug>(textobj-sandwich-query-i)
	omap as <Plug>(textobj-sandwich-query-a)
	xmap as <Plug>(textobj-sandwich-query-a)
endif

if dein#tap('vim-operator-replace')
	xmap p <Plug>(operator-replace)
endif

if dein#tap('vim-operator-flashy')
	map y <Plug>(operator-flashy)
	nmap Y <Plug>(operator-flashy)$
endif

if dein#tap('vim-niceblock')
	silent! xmap I  <Plug>(niceblock-I)
	silent! xmap gI <Plug>(niceblock-gI)
	silent! xmap A  <Plug>(niceblock-A)
endif

if dein#tap('accelerated-jk')
	nmap <silent>j <Plug>(accelerated_jk_gj)
	nmap <silent>k <Plug>(accelerated_jk_gk)
endif

if dein#tap('vim-edgemotion')
	map gj <Plug>(edgemotion-j)
	map gk <Plug>(edgemotion-k)
	xmap gj <Plug>(edgemotion-j)
	xmap gk <Plug>(edgemotion-k)
endif

if dein#tap('vim-quickhl')
	nmap mt <Plug>(quickhl-manual-this)
	xmap mt <Plug>(quickhl-manual-this)
	nmap mC <Plug>(quickhl-manual-reset)
endif

if dein#tap('vim-sidemenu')
	nmap <Leader>l <Plug>(sidemenu)
	xmap <Leader>l <Plug>(sidemenu-visual)
endif

if dein#tap('vim-indent-guides')
	nmap <silent><Leader>ti :<C-u>IndentGuidesToggle<CR>
endif

if dein#tap('vim-signature')
	let g:SignatureIncludeMarks = 'abcdefghijkloqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
	let g:SignatureMap = {
		\ 'Leader':            'm',
		\ 'ListBufferMarks':   'm/',
		\ 'ListBufferMarkers': 'm?',
		\ 'PlaceNextMark':     'm,',
		\ 'ToggleMarkAtLine':  'mm',
		\ 'PurgeMarksAtLine':  'm-',
		\ 'DeleteMark':        'dm',
		\ 'PurgeMarks':        'm<Space>',
		\ 'PurgeMarkers':      'm<BS>',
		\ 'GotoNextLineAlpha': "']",
		\ 'GotoPrevLineAlpha': "'[",
		\ 'GotoNextSpotAlpha': '`]',
		\ 'GotoPrevSpotAlpha': '`[',
		\ 'GotoNextLineByPos': "]'",
		\ 'GotoPrevLineByPos': "['",
		\ 'GotoNextSpotByPos': 'mn',
		\ 'GotoPrevSpotByPos': 'mp',
		\ 'GotoNextMarker':    ']-',
		\ 'GotoPrevMarker':    '[-',
		\ 'GotoNextMarkerAny': ']=',
		\ 'GotoPrevMarkerAny': '[=',
		\ }
endif

if dein#tap('auto-git-diff')
	autocmd user_events FileType gitrebase
		\  nmap <buffer><CR>  <Plug>(auto_git_diff_scroll_manual_update)
		\| nmap <buffer><C-n> <Plug>(auto_git_diff_scroll_down_page)
		\| nmap <buffer><C-p> <Plug>(auto_git_diff_scroll_up_page)
		\| nmap <buffer><C-d> <Plug>(auto_git_diff_scroll_down_half)
		\| nmap <buffer><C-u> <Plug>(auto_git_diff_scroll_up_half)
endif

if dein#tap('committia.vim')
	let g:committia_hooks = {}
	function! g:committia_hooks.edit_open(info)
		imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
		imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)

		setlocal winminheight=1 winheight=1
		resize 10
		startinsert
	endfunction
endif

if dein#tap('python_match.vim')
	nmap <buffer> {{ [%
	nmap <buffer> }} ]%
endif

if dein#tap('goyo.vim')
	nnoremap <Leader>G :Goyo<CR>
endif

if dein#tap('vimwiki')
	nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
endif

if dein#tap('vim-choosewin')
	nmap -         <Plug>(choosewin)
	nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>
endif

if dein#tap('jedi-vim')
	let g:jedi#completions_command = ''
	let g:jedi#goto_command = '<C-]>'
	let g:jedi#goto_assignments_command = 'gy'
	let g:jedi#documentation_command = 'K'
	let g:jedi#usages_command = 'gr'
	let g:jedi#rename_command = '<Leader>R'
endif

if dein#tap('tern_for_vim')
	autocmd user_events FileType javascript,javascriptreact
		\  nnoremap <silent><buffer> K          :<C-u>TernDoc<CR>
		\| nnoremap <silent><buffer> <C-]>      :<C-u>TernDefSplit<CR>
		\| nnoremap <silent><buffer> gy         :<C-u>TernType<CR>
		\| nnoremap <silent><buffer> gr         :<C-u>TernRefs<CR>
		\| nnoremap <silent><buffer> <leader>R  :<C-u>TernRename<CR>
endif

if dein#tap('vim-gitgutter')
	nmap ]g <Plug>(GitGutterNextHunk)
	nmap [g <Plug>(GitGutterPrevHunk)
	nmap gS <Plug>(GitGutterStageHunk)
	xmap gS <Plug>(GitGutterStageHunk)
	nmap <Leader>gr <Plug>(GitGutterUndoHunk)
	nmap gs <Plug>(GitGutterPreviewHunk)
endif

if dein#tap('vim-go')
	autocmd user_events FileType go
		\   nmap <C-]> <Plug>(go-def)
		\ | nmap <Leader>god  <Plug>(go-describe)
		\ | nmap <Leader>goc  <Plug>(go-callees)
		\ | nmap <Leader>goC  <Plug>(go-callers)
		\ | nmap <Leader>goi  <Plug>(go-info)
		\ | nmap <Leader>gom  <Plug>(go-implements)
		\ | nmap <Leader>gos  <Plug>(go-callstack)
		\ | nmap <Leader>goe  <Plug>(go-referrers)
		\ | nmap <Leader>gor  <Plug>(go-run)
		\ | nmap <Leader>gov  <Plug>(go-vet)
		\ | nmap <Leader>gtf  <Plug>(go-test-func)
		\ | nmap fd  <Plug>(go-def-vertical)
endif

if dein#tap('phpcomplete-extended')
	autocmd user_events FileType php
		\   nmap <silent> <unique> K <Plug>(phpcomplete-extended-doc)
		\ | nmap <silent> <unique> <C-]> <Plug>(phpcomplete-extended-goto)
		\ | nmap <silent> <unique> <Leader>a <Plug>(phpcomplete-extended-add-use)
endif

if dein#tap('vimagit')
	nnoremap <silent> <Leader>mg :Magit<CR>
endif

if dein#tap('vim-easygit')
	nnoremap <silent> <leader>gd :Gdiff<CR>
	nnoremap <silent> <leader>gD :Gdiffoff<CR>
	nnoremap <silent> <leader>gc :Gcommit<CR>
	nnoremap <silent> <leader>gb :Gblame<CR>
	nnoremap <silent> <leader>gB :Gbrowse<CR>
	nnoremap <silent> <leader>gS :Gstatus<CR>
	nnoremap <silent> <leader>gp :Gpush<CR>
endif

if dein#tap('vim-altr')
	nmap <leader>n  <Plug>(altr-forward)
	nmap <leader>N  <Plug>(altr-back)
endif

if dein#tap('open-browser.vim')
	nmap gx <Plug>(openbrowser-smart-search)
	vmap gx <Plug>(openbrowser-smart-search)
endif

if dein#tap('undotree')
	nnoremap <Leader>gu :UndotreeToggle<CR>
endif

if dein#tap('thesaurus_query.vim')
	nnoremap <silent> <Leader>K :<C-u>ThesaurusQueryReplaceCurrentWord<CR>
endif

if dein#tap('vim-asterisk')
	map *   <Plug>(asterisk-g*)
	map g*  <Plug>(asterisk-*)
	map #   <Plug>(asterisk-g#)
	map g#  <Plug>(asterisk-#)

	map z*  <Plug>(asterisk-z*)
	map gz* <Plug>(asterisk-gz*)
	map z#  <Plug>(asterisk-z#)
	map gz# <Plug>(asterisk-gz#)
endif

if dein#tap('vim-expand-region')
	xmap v <Plug>(expand_region_expand)
	xmap V <Plug>(expand_region_shrink)
endif

if dein#tap('sideways.vim')
	nnoremap <silent> <, :SidewaysLeft<CR>
	nnoremap <silent> >, :SidewaysRight<CR>
	nnoremap <silent> [, :SidewaysJumpLeft<CR>
	nnoremap <silent> ], :SidewaysJumpRight<CR>
	omap <silent> a, <Plug>SidewaysArgumentTextobjA
	xmap <silent> a, <Plug>SidewaysArgumentTextobjA
	omap <silent> i, <Plug>SidewaysArgumentTextobjI
	xmap <silent> i, <Plug>SidewaysArgumentTextobjI
endif

if dein#tap('splitjoin.vim')
	let g:splitjoin_join_mapping = ''
	let g:splitjoin_split_mapping = ''
	nmap sj :SplitjoinJoin<CR>
	nmap sk :SplitjoinSplit<CR>
endif

if dein#tap('linediff.vim')
	vnoremap <Leader>mdf :Linediff<CR>
	vnoremap <Leader>mda :LinediffAdd<CR>
	nnoremap <Leader>mds :<C-u>LinediffShow<CR>
	nnoremap <Leader>mdr :<C-u>LinediffReset<CR>
endif

if dein#tap('dsf.vim')
	nmap dsf <Plug>DsfDelete
	nmap csf <Plug>DsfChange
endif

if dein#tap('caw.vim')
	function! InitCaw() abort
		if ! &l:modifiable
			silent! nunmap <buffer> <Leader>V
			silent! xunmap <buffer> <Leader>V
			silent! nunmap <buffer> <Leader>v
			silent! xunmap <buffer> <Leader>v
			silent! nunmap <buffer> gc
			silent! xunmap <buffer> gc
			silent! nunmap <buffer> gcc
			silent! xunmap <buffer> gcc
		else
			xmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
			nmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
			xmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
			nmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
			nmap <buffer> gc <Plug>(caw:prefix)
			xmap <buffer> gc <Plug>(caw:prefix)
			nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
			xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
		endif
	endfunction
	autocmd user_events FileType * call InitCaw()
	call InitCaw()
endif

if dein#tap('vim-textobj-multiblock')
	omap <silent> ab <Plug>(textobj-multiblock-a)
	omap <silent> ib <Plug>(textobj-multiblock-i)
	xmap <silent> ab <Plug>(textobj-multiblock-a)
	xmap <silent> ib <Plug>(textobj-multiblock-i)
endif

if dein#tap('vim-textobj-function')
	omap <silent> af <Plug>(textobj-function-a)
	omap <silent> if <Plug>(textobj-function-i)
	xmap <silent> af <Plug>(textobj-function-a)
	xmap <silent> if <Plug>(textobj-function-i)
endif

if dein#tap('vim-easymotion')
	nmap ss <Plug>(easymotion-s2)
endif

if dein#tap('vim-airline')
	let g:airline_powerline_fonts=1
	let g:airline_theme = 'wombat'
	let g:airline#extensions#tabline#enabled = 1
	function! ArilineInit()
			let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
			let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%F'])
			"let g:airline_section_c = airline#section#create(['filetype'])
			let g:airline_section_x = airline#section#create(['%P'])
			let g:airline_section_y = airline#section#create(['%B'])
			let g:airline_section_z = airline#section#create_right(['%l', '%c'])
	endfunction
endif

if dein#tap('incsearch-fuzzy.vim')
	map z/ <Plug>(incsearch-fuzzy-/)
	map z? <Plug>(incsearch-fuzzy-?)
	map zg/ <Plug>(incsearch-fuzzy-stay)
endif

if dein#tap('python-mode')
	" 注意如果使用了 rope 一般是项目根目录打开文件，不要切到子目录
	" set noautochdir 注意这个自动切换目录会使rope找目录不正确，禁用，坑死我
	" 如果你发现找不到你的 package 或者系统的，编辑你的代码根目录下 .ropeproject/config.py 里的文件就可以了
	" 比如加上 prefs.add('python_path', '/usr/local/lib/python2.7/site-packages/') 就可以找到系统包了

	" when PYTHON_VERSION env variable is set, use python2. default Use python3
	" ch: 如果设置了 export PYTHON_VERSION=2 环境变量使用 python2 ，否则默认 python3
	if $PYTHON_VERSION == '2'
		let g:pymode_python = 'python'  " Values are `python`, `python3`, `disable`.
	else
		let g:pymode_python = 'python3'  " Values are `python`, `python3`, `disable`.
	endif
	let g:pymode_paths = reverse(split(globpath(getcwd().'/eggs', '*'), '\n'))    " support zc.buildout
	let g:pymode_trim_whitespaces = 1
	let g:pymode_quickfix_maxheight = 3
	let g:pymode_indent = 1
	let g:pymode_folding = 1
	let g:pymode_breakpoint = 1
	let g:pymode_breakpoint_bind = "<C-d>"  " NOTE: use ctrl+d insert ipdb
	let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # BREAKPOINT TODO REMOVE; from nose.tools import set_trace; set_trace()'

	let g:pymode_run = 1
	let g:pymode_run_bind = "<C-e>"
	let g:pymode_virtualenv = 1
	let g:pymode_virtualenv_path = $VIRTUAL_ENV

	" Override view python doc key shortcut to Ctrl-Shift-d
	let g:pymode_doc=1
	let g:pymode_doc_bind = 'K'

	autocmd CompleteDone * pclose
	autocmd FileType python setlocal omnifunc=RopeCompleteFunc
	" WARNING: rope complete conflict with jedi, choose one of them
	let g:pymode_rope = 1
	let g:pymode_rope_autoimport = 0
	let g:pymode_rope_complete_on_dot = 0
	let g:pymode_rope_lookup_project = 0
	let g:pymode_rope_goto_definition_bind = "<C-]>"
	let g:pymode_rope_goto_definition_cmd = 'vnew'
	let g:pymode_rope_regenerate_on_write = 0
	" command PR PymodeRopeRegenerate

	let g:pymode_lint = 1
	let g:pymode_lint_on_write = 1
	let g:pymode_lint_on_fly = 0
	let g:pymode_lint_message = 1
	let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
	let g:pymode_lint_ignore = ["C0103, C0111, C0301, C0304, C0325, E0702, E1120, R0201, R0903, R0911, R0912, R0913, R1705, W0105, W0108, W0110, W0201, W0221, W0223, W0235, W0403, W0511, W0622, W0703, W1202"]
	let g:pymode_lint_options_mccabe = { 'complexity': 15 }
	let g:pymode_lint_signs = 1
	" if you want use emoji you shoud set : Iterm2->Profiles->Text->Use Unicode versoin 9 widths
	let g:pymode_lint_todo_symbol = '😡'
	" let g:pymode_lint_error_symbol = '❌'
	" let g:pymode_lint_comment_symbol = '😢'
	" let g:pymode_lint_comment_symbol = "❗"
	let g:pymode_lint_error_symbol = "\U2717"
	let g:pymode_lint_comment_symbol = "\u2757"
	let g:pymode_lint_visual_symbol = "\u0021"

	" 修改默认的红线为浅色，solorized黑色主题
	highlight ColorColumn ctermbg=233
	let g:pymode_lint_cwindow = 0
	let g:pymode_options_max_line_length = 120
	let g:pymode_options_colorcolumn = 1
	" 指定UltiSnips python的docstring风格, sphinx, google, numpy
	let g:ultisnips_python_style = 'sphinx'
	" http://stackoverflow.com/questions/16021297/how-to-map-alias-a-command-in-vim, PymodeLint映射成PL
	" command PLT PymodeLint
	" command PLA PymodeLintAuto    " auto fix pep8
endif

" vim: set ts=2 sw=2 tw=80 noet :
