let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <SNR>33_AutoPairsReturn =AutoPairsReturn()
imap <C-G>S <Plug>ISurround
imap <C-G>s <Plug>Isurround
imap <C-S> <Plug>Isurround
inoremap <silent> <C-Tab> =UltiSnips#ListSnippets()
inoremap <silent> <Plug>NERDCommenterInsert  <BS>:call NERDComment('i', 'insert')
inoremap <silent> <Plug>(fzf-maps-i) :call fzf#vim#maps('i', 0)
inoremap <expr> <Plug>(fzf-complete-buffer-line) fzf#vim#complete#buffer_line()
inoremap <expr> <Plug>(fzf-complete-line) fzf#vim#complete#line()
inoremap <expr> <Plug>(fzf-complete-file-ag) fzf#vim#complete#path('ag -l -g ""')
inoremap <expr> <Plug>(fzf-complete-file) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -type f -print -o -type l -print | sed 's:^..::'")
inoremap <expr> <Plug>(fzf-complete-path) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -print | sed '1d;s:^..::'")
inoremap <expr> <Plug>(fzf-complete-word) fzf#vim#complete#word()
inoremap <silent> <Plug>CocRefresh =coc#_complete()
inoremap <Down> :echoe "use j"
inoremap <Up> :echoe "use k"
inoremap <Right> :echoe "use l"
inoremap <Left> :echoe "use h"
snoremap <silent>  "_c
nnoremap  h
xnoremap <silent> 	 :call UltiSnips#SaveLastVisualSelection()gvs
snoremap <silent> 	 :call UltiSnips#ExpandSnippet()
nnoremap <NL> j
nnoremap  k
nnoremap  l
nnoremap <silent>  :Files
snoremap  "_c
nmap <silent> ,6 :call BufstopSwitchTo(5)
nmap <silent> ,5 :call BufstopSwitchTo(4)
nmap <silent> ,4 :call BufstopSwitchTo(3)
nmap <silent> ,3 :call BufstopSwitchTo(2)
nmap <silent> ,2 :call BufstopSwitchTo(1)
nmap <silent> ,1 :call BufstopSwitchTo(0)
nmap ,ca <Plug>NERDCommenterAltDelims
xmap ,cu <Plug>NERDCommenterUncomment
nmap ,cu <Plug>NERDCommenterUncomment
xmap ,cb <Plug>NERDCommenterAlignBoth
nmap ,cb <Plug>NERDCommenterAlignBoth
xmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cA <Plug>NERDCommenterAppend
xmap ,cy <Plug>NERDCommenterYank
nmap ,cy <Plug>NERDCommenterYank
xmap ,cs <Plug>NERDCommenterSexy
nmap ,cs <Plug>NERDCommenterSexy
xmap ,ci <Plug>NERDCommenterInvert
nmap ,ci <Plug>NERDCommenterInvert
nmap ,c$ <Plug>NERDCommenterToEOL
xmap ,cn <Plug>NERDCommenterNested
nmap ,cn <Plug>NERDCommenterNested
xmap ,cm <Plug>NERDCommenterMinimal
nmap ,cm <Plug>NERDCommenterMinimal
xmap ,c  <Plug>NERDCommenterToggle
nmap ,c  <Plug>NERDCommenterToggle
xmap ,cc <Plug>NERDCommenterComment
nmap ,cc <Plug>NERDCommenterComment
nmap <silent> ,f <Plug>(coc-format-selected)
xmap <silent> ,f <Plug>(coc-format-selected)
nmap <silent> ,k <Plug>(coc-diagnostic-prev)
nmap <silent> ,j <Plug>(coc-diagnostic-next)
nnoremap <silent> ,b :Buffers
xmap S <Plug>VSurround
nmap cS <Plug>CSurround
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
nmap q <Nop>
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
vnoremap <silent> <Plug>(coc-explorer-action-v->>) :call coc#rpc#request('doKeymap', ['explorer-action-v->>'])
nnoremap <silent> <Plug>(coc-explorer-action-n->>) :call coc#rpc#request('doKeymap', ['explorer-action-n->>'])
vnoremap <silent> <Plug>(coc-explorer-action-v-<<) :call coc#rpc#request('doKeymap', ['explorer-action-v-<<'])
nnoremap <silent> <Plug>(coc-explorer-action-n-<<) :call coc#rpc#request('doKeymap', ['explorer-action-n-<<'])
vnoremap <silent> <Plug>(coc-explorer-action-v-]c) :call coc#rpc#request('doKeymap', ['explorer-action-v-]c'])
nnoremap <silent> <Plug>(coc-explorer-action-n-]c) :call coc#rpc#request('doKeymap', ['explorer-action-n-]c'])
vnoremap <silent> <Plug>(coc-explorer-action-v-[c) :call coc#rpc#request('doKeymap', ['explorer-action-v-[c'])
nnoremap <silent> <Plug>(coc-explorer-action-n-[c) :call coc#rpc#request('doKeymap', ['explorer-action-n-[c'])
vnoremap <silent> <Plug>(coc-explorer-action-v-]d) :call coc#rpc#request('doKeymap', ['explorer-action-v-]d'])
nnoremap <silent> <Plug>(coc-explorer-action-n-]d) :call coc#rpc#request('doKeymap', ['explorer-action-n-]d'])
vnoremap <silent> <Plug>(coc-explorer-action-v-[d) :call coc#rpc#request('doKeymap', ['explorer-action-v-[d'])
nnoremap <silent> <Plug>(coc-explorer-action-n-[d) :call coc#rpc#request('doKeymap', ['explorer-action-n-[d'])
vnoremap <silent> <Plug>(coc-explorer-action-v-]m) :call coc#rpc#request('doKeymap', ['explorer-action-v-]m'])
nnoremap <silent> <Plug>(coc-explorer-action-n-]m) :call coc#rpc#request('doKeymap', ['explorer-action-n-]m'])
vnoremap <silent> <Plug>(coc-explorer-action-v-[m) :call coc#rpc#request('doKeymap', ['explorer-action-v-[m'])
nnoremap <silent> <Plug>(coc-explorer-action-n-[m) :call coc#rpc#request('doKeymap', ['explorer-action-n-[m'])
vnoremap <silent> <Plug>(coc-explorer-action-v-]i) :call coc#rpc#request('doKeymap', ['explorer-action-v-]i'])
nnoremap <silent> <Plug>(coc-explorer-action-n-]i) :call coc#rpc#request('doKeymap', ['explorer-action-n-]i'])
vnoremap <silent> <Plug>(coc-explorer-action-v-[i) :call coc#rpc#request('doKeymap', ['explorer-action-v-[i'])
nnoremap <silent> <Plug>(coc-explorer-action-n-[i) :call coc#rpc#request('doKeymap', ['explorer-action-n-[i'])
vnoremap <silent> <Plug>(coc-explorer-action-v-]]) :call coc#rpc#request('doKeymap', ['explorer-action-v-]]'])
nnoremap <silent> <Plug>(coc-explorer-action-n-]]) :call coc#rpc#request('doKeymap', ['explorer-action-n-]]'])
vnoremap <silent> <Plug>(coc-explorer-action-v-[[) :call coc#rpc#request('doKeymap', ['explorer-action-v-[['])
nnoremap <silent> <Plug>(coc-explorer-action-n-[[) :call coc#rpc#request('doKeymap', ['explorer-action-n-[['])
vnoremap <silent> <Plug>(coc-explorer-action-v-gb) :call coc#rpc#request('doKeymap', ['explorer-action-v-gb'])
nnoremap <silent> <Plug>(coc-explorer-action-n-gb) :call coc#rpc#request('doKeymap', ['explorer-action-n-gb'])
vnoremap <silent> <Plug>(coc-explorer-action-v-gf) :call coc#rpc#request('doKeymap', ['explorer-action-v-gf'])
nnoremap <silent> <Plug>(coc-explorer-action-n-gf) :call coc#rpc#request('doKeymap', ['explorer-action-n-gf'])
vnoremap <silent> <Plug>(coc-explorer-action-v-F) :call coc#rpc#request('doKeymap', ['explorer-action-v-F'])
nnoremap <silent> <Plug>(coc-explorer-action-n-F) :call coc#rpc#request('doKeymap', ['explorer-action-n-F'])
vnoremap <silent> <Plug>(coc-explorer-action-v-f) :call coc#rpc#request('doKeymap', ['explorer-action-v-f'])
nnoremap <silent> <Plug>(coc-explorer-action-n-f) :call coc#rpc#request('doKeymap', ['explorer-action-n-f'])
vnoremap <silent> <Plug>(coc-explorer-action-v-gd) :call coc#rpc#request('doKeymap', ['explorer-action-v-gd'])
nnoremap <silent> <Plug>(coc-explorer-action-n-gd) :call coc#rpc#request('doKeymap', ['explorer-action-n-gd'])
vnoremap <silent> <Plug>(coc-explorer-action-v-X) :call coc#rpc#request('doKeymap', ['explorer-action-v-X'])
nnoremap <silent> <Plug>(coc-explorer-action-n-X) :call coc#rpc#request('doKeymap', ['explorer-action-n-X'])
vnoremap <silent> <Plug>(coc-explorer-action-v-q) :call coc#rpc#request('doKeymap', ['explorer-action-v-q'])
nnoremap <silent> <Plug>(coc-explorer-action-n-q) :call coc#rpc#request('doKeymap', ['explorer-action-n-q'])
vnoremap <silent> <Plug>(coc-explorer-action-v-?) :call coc#rpc#request('doKeymap', ['explorer-action-v-?'])
nnoremap <silent> <Plug>(coc-explorer-action-n-?) :call coc#rpc#request('doKeymap', ['explorer-action-n-?'])
vnoremap <silent> <Plug>(coc-explorer-action-v-R) :call coc#rpc#request('doKeymap', ['explorer-action-v-R'])
nnoremap <silent> <Plug>(coc-explorer-action-n-R) :call coc#rpc#request('doKeymap', ['explorer-action-n-R'])
vnoremap <silent> <Plug>(coc-explorer-action-v-.) :call coc#rpc#request('doKeymap', ['explorer-action-v-.'])
nnoremap <silent> <Plug>(coc-explorer-action-n-.) :call coc#rpc#request('doKeymap', ['explorer-action-n-.'])
vnoremap <silent> <Plug>(coc-explorer-action-v-r) :call coc#rpc#request('doKeymap', ['explorer-action-v-r'])
nnoremap <silent> <Plug>(coc-explorer-action-n-r) :call coc#rpc#request('doKeymap', ['explorer-action-n-r'])
vnoremap <silent> <Plug>(coc-explorer-action-v-A) :call coc#rpc#request('doKeymap', ['explorer-action-v-A'])
nnoremap <silent> <Plug>(coc-explorer-action-n-A) :call coc#rpc#request('doKeymap', ['explorer-action-n-A'])
vnoremap <silent> <Plug>(coc-explorer-action-v-a) :call coc#rpc#request('doKeymap', ['explorer-action-v-a'])
nnoremap <silent> <Plug>(coc-explorer-action-n-a) :call coc#rpc#request('doKeymap', ['explorer-action-n-a'])
vnoremap <silent> <Plug>(coc-explorer-action-v-D) :call coc#rpc#request('doKeymap', ['explorer-action-v-D'])
nnoremap <silent> <Plug>(coc-explorer-action-n-D) :call coc#rpc#request('doKeymap', ['explorer-action-n-D'])
vnoremap <silent> <Plug>(coc-explorer-action-v-d) :call coc#rpc#request('doKeymap', ['explorer-action-v-d'])
nnoremap <silent> <Plug>(coc-explorer-action-n-d) :call coc#rpc#request('doKeymap', ['explorer-action-n-d'])
vnoremap <silent> <Plug>(coc-explorer-action-v-p) :call coc#rpc#request('doKeymap', ['explorer-action-v-p'])
nnoremap <silent> <Plug>(coc-explorer-action-n-p) :call coc#rpc#request('doKeymap', ['explorer-action-n-p'])
vnoremap <silent> <Plug>(coc-explorer-action-v-x) :call coc#rpc#request('doKeymap', ['explorer-action-v-x'])
nnoremap <silent> <Plug>(coc-explorer-action-n-x) :call coc#rpc#request('doKeymap', ['explorer-action-n-x'])
vnoremap <silent> <Plug>(coc-explorer-action-v-c) :call coc#rpc#request('doKeymap', ['explorer-action-v-c'])
nnoremap <silent> <Plug>(coc-explorer-action-n-c) :call coc#rpc#request('doKeymap', ['explorer-action-n-c'])
vnoremap <silent> <Plug>(coc-explorer-action-v-Y) :call coc#rpc#request('doKeymap', ['explorer-action-v-Y'])
nnoremap <silent> <Plug>(coc-explorer-action-n-Y) :call coc#rpc#request('doKeymap', ['explorer-action-n-Y'])
vnoremap <silent> <Plug>(coc-explorer-action-v-y) :call coc#rpc#request('doKeymap', ['explorer-action-v-y'])
nnoremap <silent> <Plug>(coc-explorer-action-n-y) :call coc#rpc#request('doKeymap', ['explorer-action-n-y'])
vnoremap <silent> <Plug>(coc-explorer-action-v-gp) :call coc#rpc#request('doKeymap', ['explorer-action-v-gp'])
nnoremap <silent> <Plug>(coc-explorer-action-n-gp) :call coc#rpc#request('doKeymap', ['explorer-action-n-gp'])
vnoremap <silent> <Plug>(coc-explorer-action-v-gs) :call coc#rpc#request('doKeymap', ['explorer-action-v-gs'])
nnoremap <silent> <Plug>(coc-explorer-action-n-gs) :call coc#rpc#request('doKeymap', ['explorer-action-n-gs'])
vnoremap <silent> <Plug>(coc-explorer-action-v-[bs]) :call coc#rpc#request('doKeymap', ['explorer-action-v-[bs]'])
nnoremap <silent> <Plug>(coc-explorer-action-n-[bs]) :call coc#rpc#request('doKeymap', ['explorer-action-n-[bs]'])
vnoremap <silent> <Plug>(coc-explorer-action-v-t) :call coc#rpc#request('doKeymap', ['explorer-action-v-t'])
nnoremap <silent> <Plug>(coc-explorer-action-n-t) :call coc#rpc#request('doKeymap', ['explorer-action-n-t'])
vnoremap <silent> <Plug>(coc-explorer-action-v-E) :call coc#rpc#request('doKeymap', ['explorer-action-v-E'])
nnoremap <silent> <Plug>(coc-explorer-action-n-E) :call coc#rpc#request('doKeymap', ['explorer-action-n-E'])
vnoremap <silent> <Plug>(coc-explorer-action-v-s) :call coc#rpc#request('doKeymap', ['explorer-action-v-s'])
nnoremap <silent> <Plug>(coc-explorer-action-n-s) :call coc#rpc#request('doKeymap', ['explorer-action-n-s'])
vnoremap <silent> <Plug>(coc-explorer-action-v-e) :call coc#rpc#request('doKeymap', ['explorer-action-v-e'])
nnoremap <silent> <Plug>(coc-explorer-action-n-e) :call coc#rpc#request('doKeymap', ['explorer-action-n-e'])
vnoremap <silent> <Plug>(coc-explorer-action-v-[cr]) :call coc#rpc#request('doKeymap', ['explorer-action-v-[cr]'])
nnoremap <silent> <Plug>(coc-explorer-action-n-[cr]) :call coc#rpc#request('doKeymap', ['explorer-action-n-[cr]'])
nnoremap <silent> <Plug>(coc-explorer-action-n-o) :call coc#rpc#request('doKeymap', ['explorer-action-n-o'])
vnoremap <silent> <Plug>(coc-explorer-action-v-[2-LeftMouse]) :call coc#rpc#request('doKeymap', ['explorer-action-v-[2-LeftMouse]'])
nnoremap <silent> <Plug>(coc-explorer-action-n-[2-LeftMouse]) :call coc#rpc#request('doKeymap', ['explorer-action-n-[2-LeftMouse]'])
vnoremap <silent> <Plug>(coc-explorer-action-v-gh) :call coc#rpc#request('doKeymap', ['explorer-action-v-gh'])
nnoremap <silent> <Plug>(coc-explorer-action-n-gh) :call coc#rpc#request('doKeymap', ['explorer-action-n-gh'])
vnoremap <silent> <Plug>(coc-explorer-action-v-gl) :call coc#rpc#request('doKeymap', ['explorer-action-v-gl'])
nnoremap <silent> <Plug>(coc-explorer-action-n-gl) :call coc#rpc#request('doKeymap', ['explorer-action-n-gl'])
vnoremap <silent> <Plug>(coc-explorer-action-v-K) :call coc#rpc#request('doKeymap', ['explorer-action-v-K'])
nnoremap <silent> <Plug>(coc-explorer-action-n-K) :call coc#rpc#request('doKeymap', ['explorer-action-n-K'])
vnoremap <silent> <Plug>(coc-explorer-action-v-J) :call coc#rpc#request('doKeymap', ['explorer-action-v-J'])
nnoremap <silent> <Plug>(coc-explorer-action-n-J) :call coc#rpc#request('doKeymap', ['explorer-action-n-J'])
vnoremap <silent> <Plug>(coc-explorer-action-v-l) :call coc#rpc#request('doKeymap', ['explorer-action-v-l'])
nnoremap <silent> <Plug>(coc-explorer-action-n-l) :call coc#rpc#request('doKeymap', ['explorer-action-n-l'])
vnoremap <silent> <Plug>(coc-explorer-action-v-h) :call coc#rpc#request('doKeymap', ['explorer-action-v-h'])
nnoremap <silent> <Plug>(coc-explorer-action-n-h) :call coc#rpc#request('doKeymap', ['explorer-action-n-h'])
vnoremap <silent> <Plug>(coc-explorer-action-v-gj) :call coc#rpc#request('doKeymap', ['explorer-action-v-gj'])
nnoremap <silent> <Plug>(coc-explorer-action-n-gj) :call coc#rpc#request('doKeymap', ['explorer-action-n-gj'])
vnoremap <silent> <Plug>(coc-explorer-action-v-gk) :call coc#rpc#request('doKeymap', ['explorer-action-v-gk'])
nnoremap <silent> <Plug>(coc-explorer-action-n-gk) :call coc#rpc#request('doKeymap', ['explorer-action-n-gk'])
vnoremap <silent> <Plug>(coc-explorer-action-v-[tab]) :call coc#rpc#request('doKeymap', ['explorer-action-v-[tab]'])
nnoremap <silent> <Plug>(coc-explorer-action-n-[tab]) :call coc#rpc#request('doKeymap', ['explorer-action-n-[tab]'])
vnoremap <silent> <Plug>(coc-explorer-action-v-*) :call coc#rpc#request('doKeymap', ['explorer-action-v-*'])
nnoremap <silent> <Plug>(coc-explorer-action-n-*) :call coc#rpc#request('doKeymap', ['explorer-action-n-*'])
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <silent> <Plug>GitGutterPreviewHunk :call gitgutter#utility#warn('please change your map <Plug>GitGutterPreviewHunk to <Plug>(GitGutterPreviewHunk)')
nnoremap <silent> <Plug>(GitGutterPreviewHunk) :GitGutterPreviewHunk
nnoremap <silent> <Plug>GitGutterUndoHunk :call gitgutter#utility#warn('please change your map <Plug>GitGutterUndoHunk to <Plug>(GitGutterUndoHunk)')
nnoremap <silent> <Plug>(GitGutterUndoHunk) :GitGutterUndoHunk
nnoremap <silent> <Plug>GitGutterStageHunk :call gitgutter#utility#warn('please change your map <Plug>GitGutterStageHunk to <Plug>(GitGutterStageHunk)')
nnoremap <silent> <Plug>(GitGutterStageHunk) :GitGutterStageHunk
xnoremap <silent> <Plug>GitGutterStageHunk :call gitgutter#utility#warn('please change your map <Plug>GitGutterStageHunk to <Plug>(GitGutterStageHunk)')
xnoremap <silent> <Plug>(GitGutterStageHunk) :GitGutterStageHunk
nnoremap <silent> <expr> <Plug>GitGutterPrevHunk &diff ? '[c' : ":\call gitgutter#utility#warn('please change your map \<Plug>GitGutterPrevHunk to \<Plug>(GitGutterPrevHunk)')\"
nnoremap <silent> <expr> <Plug>(GitGutterPrevHunk) &diff ? '[c' : ":\execute v:count1 . 'GitGutterPrevHunk'\"
nnoremap <silent> <expr> <Plug>GitGutterNextHunk &diff ? ']c' : ":\call gitgutter#utility#warn('please change your map \<Plug>GitGutterNextHunk to \<Plug>(GitGutterNextHunk)')\"
nnoremap <silent> <expr> <Plug>(GitGutterNextHunk) &diff ? ']c' : ":\execute v:count1 . 'GitGutterNextHunk'\"
xnoremap <silent> <Plug>(GitGutterTextObjectOuterVisual) :call gitgutter#hunk#text_object(0)
xnoremap <silent> <Plug>(GitGutterTextObjectInnerVisual) :call gitgutter#hunk#text_object(1)
onoremap <silent> <Plug>(GitGutterTextObjectOuterPending) :call gitgutter#hunk#text_object(0)
onoremap <silent> <Plug>(GitGutterTextObjectInnerPending) :call gitgutter#hunk#text_object(1)
snoremap <C-R> "_c
snoremap <silent> <C-H> "_c
snoremap <silent> <Del> "_c
snoremap <silent> <BS> "_c
snoremap <silent> <C-Tab> :call UltiSnips#ListSnippets()
xnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("x", "Uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("n", "Uncomment")
xnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("x", "AlignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("n", "AlignBoth")
xnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("x", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("n", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAppend :call NERDComment("n", "Append")
xnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("x", "Yank")
nnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("n", "Yank")
xnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("x", "Sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("n", "Sexy")
xnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("x", "Invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("n", "Invert")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment("n", "ToEOL")
xnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("x", "Nested")
nnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("n", "Nested")
xnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("x", "Minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("n", "Minimal")
xnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("x", "Toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("n", "Toggle")
xnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("x", "Comment")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("n", "Comment")
onoremap <silent> <Plug>(fzf-maps-o) :call fzf#vim#maps('o', 0)
xnoremap <silent> <Plug>(fzf-maps-x) :call fzf#vim#maps('x', 0)
nnoremap <silent> <Plug>(fzf-maps-n) :call fzf#vim#maps('n', 0)
onoremap <silent> <Plug>(coc-classobj-a) :call coc#rpc#request('selectSymbolRange', [v:false, '', ['Interface', 'Struct', 'Class']])
onoremap <silent> <Plug>(coc-classobj-i) :call coc#rpc#request('selectSymbolRange', [v:true, '', ['Interface', 'Struct', 'Class']])
vnoremap <silent> <Plug>(coc-classobj-a) :call coc#rpc#request('selectSymbolRange', [v:false, visualmode(), ['Interface', 'Struct', 'Class']])
vnoremap <silent> <Plug>(coc-classobj-i) :call coc#rpc#request('selectSymbolRange', [v:true, visualmode(), ['Interface', 'Struct', 'Class']])
onoremap <silent> <Plug>(coc-funcobj-a) :call coc#rpc#request('selectSymbolRange', [v:false, '', ['Method', 'Function']])
onoremap <silent> <Plug>(coc-funcobj-i) :call coc#rpc#request('selectSymbolRange', [v:true, '', ['Method', 'Function']])
vnoremap <silent> <Plug>(coc-funcobj-a) :call coc#rpc#request('selectSymbolRange', [v:false, visualmode(), ['Method', 'Function']])
vnoremap <silent> <Plug>(coc-funcobj-i) :call coc#rpc#request('selectSymbolRange', [v:true, visualmode(), ['Method', 'Function']])
nnoremap <silent> <Plug>(coc-cursors-position) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'position', 'n'])
nnoremap <silent> <Plug>(coc-cursors-word) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'word', 'n'])
vnoremap <silent> <Plug>(coc-cursors-range) :call coc#rpc#request('cursorsSelect', [bufnr('%'), 'range', visualmode()])
nnoremap <Plug>(coc-refactor) :call       CocActionAsync('refactor')
nnoremap <Plug>(coc-command-repeat) :call       CocAction('repeatCommand')
nnoremap <Plug>(coc-float-jump) :call       coc#util#float_jump()
nnoremap <Plug>(coc-float-hide) :call       coc#util#float_hide()
nnoremap <Plug>(coc-fix-current) :call       CocActionAsync('doQuickfix')
nnoremap <Plug>(coc-openlink) :call       CocActionAsync('openLink')
nnoremap <Plug>(coc-references) :call       CocActionAsync('jumpReferences')
nnoremap <Plug>(coc-type-definition) :call       CocActionAsync('jumpTypeDefinition')
nnoremap <Plug>(coc-implementation) :call       CocActionAsync('jumpImplementation')
nnoremap <Plug>(coc-declaration) :call       CocActionAsync('jumpDeclaration')
nnoremap <Plug>(coc-definition) :call       CocActionAsync('jumpDefinition')
nnoremap <Plug>(coc-diagnostic-prev-error) :call       CocActionAsync('diagnosticPrevious', 'error')
nnoremap <Plug>(coc-diagnostic-next-error) :call       CocActionAsync('diagnosticNext',     'error')
nnoremap <Plug>(coc-diagnostic-prev) :call       CocActionAsync('diagnosticPrevious')
nnoremap <Plug>(coc-diagnostic-next) :call       CocActionAsync('diagnosticNext')
nnoremap <Plug>(coc-diagnostic-info) :call       CocActionAsync('diagnosticInfo')
nnoremap <Plug>(coc-format) :call       CocActionAsync('format')
nnoremap <Plug>(coc-rename) :call       CocActionAsync('rename')
nnoremap <Plug>(coc-codeaction) :call       CocActionAsync('codeAction',         '')
vnoremap <Plug>(coc-codeaction-selected) :call       CocActionAsync('codeAction',         visualmode())
vnoremap <Plug>(coc-format-selected) :call       CocActionAsync('formatSelected',     visualmode())
nnoremap <Plug>(coc-codelens-action) :call       CocActionAsync('codeLensAction')
nnoremap <Plug>(coc-range-select) :call       CocAction('rangeSelect',     '', v:true)
vnoremap <Plug>(coc-range-select-backward) :call       CocAction('rangeSelect',     visualmode(), v:false)
vnoremap <Plug>(coc-range-select) :call       CocAction('rangeSelect',     visualmode(), v:true)
nnoremap <silent> <C-P> :Files
nnoremap <C-L> l
nnoremap <C-H> h
nnoremap <C-K> k
nnoremap <C-J> j
nnoremap <Down> :echoe "use j"
nnoremap <Up> :echoe "use k"
nnoremap <Right> :echoe "use l"
nnoremap <Left> :echoe "use h"
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <silent> 	 =UltiSnips#ExpandSnippet()
imap  <Plug>Isurround
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set backupdir=~/.vim/backups
set backupskip=/tmp/*,/private/tmp/*
set binary
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nomodeline
set ruler
set runtimepath=~/.vim,~/.vim_plugged/coc.nvim,~/.vim_plugged/fzf,~/.vim_plugged/fzf.vim,~/.vim_plugged/nerdcommenter,~/.vim_plugged/ultisnips,~/.vim_plugged/vim-snippets,~/.vim_plugged/vim-gitgutter,~/.vim_plugged/vim-surround,~/.vim_plugged/vim-airline,~/.vim_plugged/bufstop,~/.vim_plugged/vim-eunuch,~/.vim_plugged/auto-pairs,~/.vim_plugged/vim-colors-solarized,~/.vim_plugged/gruvbox,~/.vim_plugged/Zenburn,~/.vim_plugged/badwolf,~/.vim_plugged/papercolor-theme,~/.linuxbrew/share/vim/vimfiles,~/.linuxbrew/share/vim/vim82,~/.linuxbrew/share/vim/vimfiles/after,~/.vim_plugged/ultisnips/after,~/.vim/after,~/.config/coc/extensions/node_modules/coc-explorer
set scrolloff=3
set shiftwidth=2
set shortmess=flnxtToOSi
set showcmd
set smartcase
set softtabstop=2
set tabstop=2
set tags=tags
set termguicolors
set undodir=~/.vim/undo
set visualbell
set wildmenu
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd vimrc
edit vimrc
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <M-n> :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> <M-p> AutoPairsToggle()
inoremap <buffer> <silent> <M-b> =AutoPairsBackInsert()
inoremap <buffer> <silent> <M-e> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
nmap <buffer> ,hp <Plug>(GitGutterPreviewHunk)
nmap <buffer> ,hu <Plug>(GitGutterUndoHunk)
nmap <buffer> ,hs <Plug>(GitGutterStageHunk)
xmap <buffer> ,hs <Plug>(GitGutterStageHunk)
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> î :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
nmap <buffer> [c <Plug>(GitGutterPrevHunk)
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*end\(f\%[unction]\|def\)\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*end\(f\%[unction]\|def\)\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*\(fu\%[nction]\|def\)\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*\(fu\%[nction]\|def\)\>', "bW")
nmap <buffer> ]c <Plug>(GitGutterNextHunk)
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*end\(f\%[unction]\|def\)\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*end\(f\%[unction]\|def\)\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*\(fu\%[nction]\|def\)\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*\(fu\%[nction]\|def\)\>', "W")
xmap <buffer> ac <Plug>(GitGutterTextObjectOuterVisual)
omap <buffer> ac <Plug>(GitGutterTextObjectOuterPending)
xmap <buffer> ic <Plug>(GitGutterTextObjectInnerVisual)
omap <buffer> ic <Plug>(GitGutterTextObjectInnerPending)
noremap <buffer> <silent> <M-n> :call AutoPairsJump()
noremap <buffer> <silent> <M-p> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal binary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,sO:#\ -,mO:#\ \ ,eO:##,:\",b:#
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},0),0],:,!^F,o,O,e,=end,=},=else,=cat,=fina,=END,0\\,0=\"\\\ 
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=:help
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=78
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 73 - ((21 * winheight(0) + 12) / 25)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
73
normal! 0
tabnext 1
badd +0 vimrc
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=flnxtToOSi
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
