" ============================================================================
" Name:        MorningHue
" Description: A vivid light colorscheme for brightly-lit environments.
"              Warm off-white background with vivid blue, purple, and magenta
"              accents. Designed for Hardware Design Verification workflows
"              (SystemVerilog, Python, Makefile, TCL, tcsh).
" Author:      Custom
" License:     MIT
" ============================================================================

" Setup {{{
set background=light
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'morninghue'
" }}}

" Palette {{{
"
" Background:  #F1EDE5  (set via terminal/.Xresources, Vim uses NONE)
" Foreground:  #444444  cterm=238   CR 8.33 AAA
"
" AAA tier (>= 7:1):
"   Vivid Blue:     #0000d7  cterm=20   CR 9.08  Keywords, module, structure
"   Dark Crimson:   #870000  cterm=88   CR 8.86  PreProc, `define, `ifdef
"   Deep Magenta:   #870087  cterm=90   CR 7.56  Control flow, always, if
"   Vivid Purple:   #5f00d7  cterm=56   CR 7.29  Type, StorageClass
"
" AA tier (>= 4.5:1):
"   Dark Teal:      #005f87  cterm=24   CR 6.06  Function, Identifier
"   Medium Blue:    #005faf  cterm=25   CR 5.52  Operator
"   Dark Golden:    #875f00  cterm=94   CR 4.90  Number, Constant (bold)
"   Bright Purple:  #af00d7  cterm=128  CR 4.73  Statement, assert
"   Vivid Red:      #d70000  cterm=160  CR 4.62  Include, import
"   Dark Green:     #005f00  cterm=22   CR 6.82  String
"   Sea Teal:       #005f5f  cterm=23   CR 6.42  Boolean, Tag
"   Deep Red:       #af0000  cterm=124  CR 6.37  Error, Exception
"
" Subtle:
"   Comment Gray:   #949494  cterm=246  CR 2.60  Comment (italic)
"   Line Numbers:   #b2b2b2  cterm=249
"   Non-text:       #bcbcbc  cterm=250
"
" UI backgrounds:
"   CursorLine:     #E4DED6  cterm=254
"   Pmenu:          #e4e4e4  cterm=254
"   StatusLine:     #005faf  cterm=25   (accent bar)
"   Visual:         #005faf  cterm=25
"   Search:         #ffff5f  cterm=227
"   Error bg:       #ffd7d7  cterm=224
"   Warning bg:     #ffffaf  cterm=229
"   DiffAdd bg:     #afffaf  cterm=157
"   DiffDel bg:     #ffd7d7  cterm=224
"   MatchParen bg:  #afd7ff  cterm=153
"   Folded bg:      #e4e4e4  cterm=254
" }}}

" Terminal and GUI detection {{{
let s:gui = has('gui_running') || (has('termguicolors') && &termguicolors)

" Suggest termguicolors for the exact warm background in true-color terminals.
" Without it, 256-color mode uses cterm 255 (#eeeeee) as the closest fallback.
if !s:gui && has('termguicolors') && !&termguicolors
  " Terminal likely supports true color but termguicolors is not set
  echomsg 'MorningHue: For the warm background, add "set termguicolors" to your vimrc'
endif

if s:gui
  let s:bg       = ' guibg=#F1EDE5 '
  let s:fg       = ' guifg=#444444 '
  let s:none_bg  = ' guibg=#F1EDE5 '
  let s:none_fg  = ' guifg=NONE '
  let s:nobg     = ' guibg=NONE '
else
  let s:bg       = ' ctermbg=255 '
  let s:fg       = ' ctermfg=238 '
  let s:none_bg  = ' ctermbg=255 '
  let s:none_fg  = ' ctermfg=NONE '
  let s:nobg     = ' ctermbg=NONE '
endif
" }}}

" Color variables {{{
if s:gui
  " --- Foreground colors ---
  let s:fg_none       = ' guifg=NONE '
  let s:fg_fg         = ' guifg=#444444 '
  let s:fg_blue       = ' guifg=#0000d7 '
  let s:fg_purple     = ' guifg=#5f00d7 '
  let s:fg_magenta    = ' guifg=#870087 '
  let s:fg_crimson    = ' guifg=#870000 '
  let s:fg_statement  = ' guifg=#af00d7 '
  let s:fg_green      = ' guifg=#005f00 '
  let s:fg_golden     = ' guifg=#875f00 '
  let s:fg_function   = ' guifg=#005f87 '
  let s:fg_operator   = ' guifg=#005faf '
  let s:fg_red        = ' guifg=#d70000 '
  let s:fg_teal       = ' guifg=#005f87 '
  let s:fg_seaTeal    = ' guifg=#005f5f '
  let s:fg_error      = ' guifg=#af0000 '
  let s:fg_comment    = ' guifg=#949494 '
  let s:fg_linenr     = ' guifg=#b2b2b2 '
  let s:fg_nontext    = ' guifg=#bcbcbc '
  let s:fg_white      = ' guifg=#eeeeee '
  let s:fg_cursorlnr  = ' guifg=#875f00 '
  let s:fg_diffadd    = ' guifg=#005f00 '
  let s:fg_diffdel    = ' guifg=#af0000 '
  let s:fg_difftext   = ' guifg=#005faf '
  let s:fg_diffchange = ' guifg=#444444 '

  " --- Background colors ---
  let s:bg_none       = ' guibg=NONE '
  let s:bg_bg         = ' guibg=#F1EDE5 '
  let s:bg_cursor     = ' guibg=#E4DED6 '
  let s:bg_pmenu      = ' guibg=#e4e4e4 '
  let s:bg_status     = ' guibg=#005faf '
  let s:bg_statusinac = ' guibg=#d0d0d0 '
  let s:bg_visual     = ' guibg=#005faf '
  let s:bg_search     = ' guibg=#ffff5f '
  let s:bg_error      = ' guibg=#ffd7d7 '
  let s:bg_warning    = ' guibg=#ffffaf '
  let s:bg_diffadd    = ' guibg=#afffaf '
  let s:bg_diffdel    = ' guibg=#ffd7d7 '
  let s:bg_difftext   = ' guibg=#ffffd7 '
  let s:bg_diffchange = ' guibg=#ffd787 '
  let s:bg_matchparen = ' guibg=#afd7ff '
  let s:bg_folded     = ' guibg=#e4e4e4 '
  let s:bg_spellbad   = ' guibg=#ffd7d7 '
  let s:bg_spellcap   = ' guibg=#ffffaf '
  let s:bg_spellrare  = ' guibg=#afffaf '
  let s:bg_spelllocal = ' guibg=#d7d7ff '
  let s:bg_tabfill    = ' guibg=#005f87 '
  let s:bg_tabinac    = ' guibg=#005faf '

  " --- Spell underline (GUI only) ---
  let s:sp_error      = ' guisp=#af0000 '
  let s:sp_warning    = ' guisp=#875f00 '
  let s:sp_info       = ' guisp=#005faf '
else
  " --- Foreground colors (256-color) ---
  let s:fg_none       = ' ctermfg=NONE '
  let s:fg_fg         = ' ctermfg=238 '
  let s:fg_blue       = ' ctermfg=20 '
  let s:fg_purple     = ' ctermfg=56 '
  let s:fg_magenta    = ' ctermfg=90 '
  let s:fg_crimson    = ' ctermfg=88 '
  let s:fg_statement  = ' ctermfg=128 '
  let s:fg_green      = ' ctermfg=22 '
  let s:fg_golden     = ' ctermfg=94 '
  let s:fg_function   = ' ctermfg=24 '
  let s:fg_operator   = ' ctermfg=25 '
  let s:fg_red        = ' ctermfg=160 '
  let s:fg_teal       = ' ctermfg=24 '
  let s:fg_seaTeal    = ' ctermfg=23 '
  let s:fg_error      = ' ctermfg=124 '
  let s:fg_comment    = ' ctermfg=246 '
  let s:fg_linenr     = ' ctermfg=249 '
  let s:fg_nontext    = ' ctermfg=250 '
  let s:fg_white      = ' ctermfg=255 '
  let s:fg_cursorlnr  = ' ctermfg=94 '
  let s:fg_diffadd    = ' ctermfg=22 '
  let s:fg_diffdel    = ' ctermfg=124 '
  let s:fg_difftext   = ' ctermfg=25 '
  let s:fg_diffchange = ' ctermfg=238 '

  " --- Background colors (256-color) ---
  " 255 = #eeeeee, closest light bg in 256 colors; use termguicolors for exact #F1EDE5
  let s:bg_none       = ' ctermbg=NONE '
  let s:bg_bg         = ' ctermbg=255 '
  let s:bg_cursor     = ' ctermbg=254 '
  let s:bg_pmenu      = ' ctermbg=254 '
  let s:bg_status     = ' ctermbg=25 '
  let s:bg_statusinac = ' ctermbg=252 '
  let s:bg_visual     = ' ctermbg=25 '
  let s:bg_search     = ' ctermbg=227 '
  let s:bg_error      = ' ctermbg=224 '
  let s:bg_warning    = ' ctermbg=229 '
  let s:bg_diffadd    = ' ctermbg=157 '
  let s:bg_diffdel    = ' ctermbg=224 '
  let s:bg_difftext   = ' ctermbg=230 '
  let s:bg_diffchange = ' ctermbg=222 '
  let s:bg_matchparen = ' ctermbg=153 '
  let s:bg_folded     = ' ctermbg=254 '
  let s:bg_spellbad   = ' ctermbg=224 '
  let s:bg_spellcap   = ' ctermbg=229 '
  let s:bg_spellrare  = ' ctermbg=157 '
  let s:bg_spelllocal = ' ctermbg=189 '
  let s:bg_tabfill    = ' ctermbg=24 '
  let s:bg_tabinac    = ' ctermbg=25 '

  let s:sp_error      = ''
  let s:sp_warning    = ''
  let s:sp_info       = ''
endif

" --- Format attributes ---
let s:ft_none      = s:gui ? ' gui=NONE cterm=NONE '      : ' cterm=NONE '
let s:ft_bold      = s:gui ? ' gui=bold cterm=bold '       : ' cterm=bold '
let s:ft_italic    = s:gui ? ' gui=italic cterm=italic '   : ' cterm=italic '
let s:ft_boldital  = s:gui ? ' gui=bold,italic cterm=bold,italic '  : ' cterm=bold,italic '
let s:ft_underline = s:gui ? ' gui=underline cterm=underline '      : ' cterm=underline '
let s:ft_underbold = s:gui ? ' gui=underline,bold cterm=underline,bold ' : ' cterm=underline,bold '
let s:ft_reverse   = s:gui ? ' gui=reverse cterm=reverse ' : ' cterm=reverse '
" }}}

" ============================================================================
" Highlight Groups
" ============================================================================

" --- Core UI --- {{{
exec 'hi Normal'       . s:fg_fg      . s:bg_bg      . s:ft_none
exec 'hi NonText'      . s:fg_nontext . s:bg_none     . s:ft_none
exec 'hi EndOfBuffer'  . s:fg_nontext . s:bg_none     . s:ft_none
exec 'hi LineNr'       . s:fg_linenr  . s:bg_none     . s:ft_none
exec 'hi CursorLine'   . s:fg_none    . s:bg_cursor   . s:ft_none
exec 'hi CursorColumn' . s:fg_none    . s:bg_cursor   . s:ft_none
exec 'hi CursorLineNr' . s:fg_cursorlnr . s:bg_none   . s:ft_bold
exec 'hi SignColumn'   . s:fg_green   . s:bg_none     . s:ft_none
exec 'hi ColorColumn'  . s:fg_none    . s:bg_cursor   . s:ft_none
exec 'hi Conceal'      . s:fg_linenr  . s:bg_none     . s:ft_none

exec 'hi Cursor'       . s:fg_white   . s:bg_status   . s:ft_none
exec 'hi lCursor'      . s:fg_white   . s:bg_status   . s:ft_none
exec 'hi TermCursor'   . s:fg_white   . s:bg_status   . s:ft_none
exec 'hi TermCursorNC' . s:fg_white   . s:bg_statusinac . s:ft_none

exec 'hi VertSplit'    . s:fg_white   . s:bg_status   . s:ft_none
exec 'hi WinSeparator' . s:fg_white   . s:bg_status   . s:ft_none
exec 'hi SpecialKey'   . s:fg_nontext . s:bg_none     . s:ft_none

exec 'hi Visual'       . s:fg_white   . s:bg_visual   . s:ft_none
exec 'hi VisualNOS'    . s:fg_white   . s:bg_visual   . s:ft_none
exec 'hi Search'       . s:fg_fg      . s:bg_search   . s:ft_none
exec 'hi IncSearch'    . s:bg_search  . s:fg_fg       . s:ft_reverse
exec 'hi CurSearch'    . s:fg_fg      . s:bg_search   . s:ft_bold
exec 'hi Substitute'   . s:fg_fg      . s:bg_search   . s:ft_none

exec 'hi StatusLine'   . s:fg_white   . s:bg_status   . s:ft_bold
exec 'hi StatusLineNC' . s:fg_fg      . s:bg_statusinac . s:ft_none
exec 'hi WildMenu'     . s:fg_fg      . s:bg_search   . s:ft_bold

exec 'hi Pmenu'        . s:fg_fg      . s:bg_pmenu    . s:ft_none
exec 'hi PmenuSel'     . s:fg_white   . s:bg_status   . s:ft_bold
exec 'hi PmenuSbar'    . s:fg_none    . s:bg_pmenu    . s:ft_none
exec 'hi PmenuThumb'   . s:fg_none    . s:bg_status   . s:ft_none

exec 'hi Folded'       . s:fg_operator . s:bg_folded  . s:ft_none
exec 'hi FoldColumn'   . s:fg_operator . s:bg_none    . s:ft_none

exec 'hi TabLine'      . s:fg_white   . s:bg_tabinac  . s:ft_none
exec 'hi TabLineFill'  . s:fg_none    . s:bg_tabfill  . s:ft_none
exec 'hi TabLineSel'   . s:fg_fg      . s:bg_pmenu    . s:ft_bold

exec 'hi MatchParen'   . s:fg_fg      . s:bg_matchparen . s:ft_bold

exec 'hi Directory'    . s:fg_operator . s:bg_none    . s:ft_none
exec 'hi ModeMsg'      . s:fg_green   . s:bg_none     . s:ft_bold
exec 'hi MoreMsg'      . s:fg_green   . s:bg_none     . s:ft_none
exec 'hi Question'     . s:fg_green   . s:bg_none     . s:ft_none
exec 'hi WarningMsg'   . s:fg_error   . s:bg_none     . s:ft_bold
exec 'hi ErrorMsg'     . s:fg_error   . s:bg_error    . s:ft_bold
exec 'hi Title'        . s:fg_operator . s:bg_none    . s:ft_bold
" }}}

" --- Diff --- {{{
exec 'hi DiffAdd'      . s:fg_diffadd    . s:bg_diffadd    . s:ft_none
exec 'hi DiffDelete'   . s:fg_diffdel    . s:bg_diffdel    . s:ft_none
exec 'hi DiffChange'   . s:fg_diffchange . s:bg_diffchange . s:ft_none
exec 'hi DiffText'     . s:fg_difftext   . s:bg_difftext   . s:ft_none
" }}}

" --- Spell --- {{{
exec 'hi SpellBad'     . s:fg_error   . s:bg_spellbad   . s:sp_error   . s:ft_underline
exec 'hi SpellCap'     . s:fg_golden  . s:bg_spellcap   . s:sp_warning . s:ft_underline
exec 'hi SpellRare'    . s:fg_green   . s:bg_spellrare  . s:sp_info    . s:ft_underline
exec 'hi SpellLocal'   . s:fg_operator . s:bg_spelllocal . s:sp_info   . s:ft_underline
" }}}

" --- Standard Syntax Groups --- {{{
exec 'hi Comment'        . s:fg_comment   . s:bg_none . s:ft_italic
exec 'hi Constant'       . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi String'         . s:fg_green     . s:bg_none . s:ft_none
exec 'hi Character'      . s:fg_green     . s:bg_none . s:ft_none
exec 'hi Number'         . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi Boolean'        . s:fg_seaTeal   . s:bg_none . s:ft_bold
exec 'hi Float'          . s:fg_golden    . s:bg_none . s:ft_bold

exec 'hi Identifier'     . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi Function'       . s:fg_function  . s:bg_none . s:ft_none

exec 'hi Statement'      . s:fg_statement . s:bg_none . s:ft_none
exec 'hi Conditional'    . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi Repeat'         . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi Label'          . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi Operator'       . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi Keyword'        . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi Exception'      . s:fg_error     . s:bg_none . s:ft_bold

exec 'hi PreProc'        . s:fg_crimson   . s:bg_none . s:ft_none
exec 'hi Include'        . s:fg_red       . s:bg_none . s:ft_none
exec 'hi Define'         . s:fg_crimson   . s:bg_none . s:ft_bold
exec 'hi Macro'          . s:fg_crimson   . s:bg_none . s:ft_bold
exec 'hi PreCondit'      . s:fg_crimson   . s:bg_none . s:ft_bold

exec 'hi Type'           . s:fg_purple   . s:bg_none . s:ft_bold
exec 'hi StorageClass'   . s:fg_purple   . s:bg_none . s:ft_bold
exec 'hi Structure'      . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi Typedef'        . s:fg_purple   . s:bg_none . s:ft_none

exec 'hi Special'        . s:fg_fg        . s:bg_none . s:ft_none
exec 'hi SpecialChar'    . s:fg_green     . s:bg_none . s:ft_none
exec 'hi Tag'            . s:fg_seaTeal   . s:bg_none . s:ft_none
exec 'hi Delimiter'      . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi SpecialComment' . s:fg_comment   . s:bg_none . s:ft_bold
exec 'hi Debug'          . s:fg_golden    . s:bg_none . s:ft_none

exec 'hi Underlined'     . s:fg_operator  . s:bg_none . s:ft_underline
exec 'hi Ignore'         . s:fg_nontext   . s:bg_none . s:ft_none
exec 'hi Error'          . s:fg_error     . s:bg_error . s:ft_bold
exec 'hi Todo'           . s:fg_red       . s:bg_none . s:ft_bold
" }}}

" ============================================================================
" Language-Specific Highlighting
" ============================================================================

" --- Verilog / SystemVerilog --- {{{
" Module boundaries — most prominent (vivid blue, bold)
exec 'hi verilogStatement'   . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi verilogLabel'       . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi verilogConditional' . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi verilogRepeat'      . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi verilogType'        . s:fg_purple   . s:bg_none . s:ft_bold
exec 'hi verilogComment'     . s:fg_comment   . s:bg_none . s:ft_italic
exec 'hi verilogString'      . s:fg_green     . s:bg_none . s:ft_none
exec 'hi verilogNumber'      . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi verilogOperator'    . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi verilogDirective'   . s:fg_crimson   . s:bg_none . s:ft_none
exec 'hi verilogConstant'    . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi verilogFunction'    . s:fg_function  . s:bg_none . s:ft_none
exec 'hi verilogGlobal'      . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi verilogTodo'        . s:fg_red       . s:bg_none . s:ft_bold

" SystemVerilog extensions
exec 'hi systemverilogStatement'   . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi systemverilogType'        . s:fg_purple   . s:bg_none . s:ft_bold
exec 'hi systemverilogTypeDef'     . s:fg_purple   . s:bg_none . s:ft_none
exec 'hi systemverilogConditional' . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi systemverilogRepeat'      . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi systemverilogComment'     . s:fg_comment   . s:bg_none . s:ft_italic
exec 'hi systemverilogString'      . s:fg_green     . s:bg_none . s:ft_none
exec 'hi systemverilogNumber'      . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi systemverilogOperator'    . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi systemverilogDirective'   . s:fg_crimson   . s:bg_none . s:ft_none

" Verification constructs — distinctive (bright purple for assertions)
exec 'hi systemverilogAssert'      . s:fg_statement . s:bg_none . s:ft_bold
exec 'hi systemverilogProperty'    . s:fg_statement . s:bg_none . s:ft_none
exec 'hi systemverilogSequence'    . s:fg_statement . s:bg_none . s:ft_none
exec 'hi systemverilogCover'       . s:fg_statement . s:bg_none . s:ft_none
exec 'hi systemverilogClocking'    . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi systemverilogFunction'    . s:fg_function  . s:bg_none . s:ft_none
exec 'hi systemverilogTask'        . s:fg_function  . s:bg_none . s:ft_none
" }}}

" --- Python --- {{{
exec 'hi pythonStatement'    . s:fg_statement . s:bg_none . s:ft_none
exec 'hi pythonConditional'  . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi pythonRepeat'       . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi pythonException'    . s:fg_error     . s:bg_none . s:ft_bold
exec 'hi pythonOperator'     . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi pythonFunction'     . s:fg_function  . s:bg_none . s:ft_none
exec 'hi pythonDecorator'    . s:fg_crimson   . s:bg_none . s:ft_none
exec 'hi pythonDecoratorName'. s:fg_crimson   . s:bg_none . s:ft_none
exec 'hi pythonComment'      . s:fg_comment   . s:bg_none . s:ft_italic
exec 'hi pythonString'       . s:fg_green     . s:bg_none . s:ft_none
exec 'hi pythonRawString'    . s:fg_green     . s:bg_none . s:ft_none
exec 'hi pythonNumber'       . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi pythonBuiltin'      . s:fg_function  . s:bg_none . s:ft_none
exec 'hi pythonBuiltinObj'   . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi pythonBuiltinFunc'  . s:fg_function  . s:bg_none . s:ft_none
exec 'hi pythonImport'       . s:fg_red       . s:bg_none . s:ft_none
exec 'hi pythonInclude'      . s:fg_red       . s:bg_none . s:ft_none
exec 'hi pythonClassVar'     . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi pythonDottedName'   . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi pythonNone'         . s:fg_seaTeal   . s:bg_none . s:ft_bold
exec 'hi pythonBoolean'      . s:fg_seaTeal   . s:bg_none . s:ft_bold
" }}}

" --- Makefile --- {{{
exec 'hi makeIdent'       . s:fg_crimson   . s:bg_none . s:ft_bold
exec 'hi makePreCondit'   . s:fg_crimson   . s:bg_none . s:ft_bold
exec 'hi makeCommands'    . s:fg_fg        . s:bg_none . s:ft_none
exec 'hi makeTarget'      . s:fg_function  . s:bg_none . s:ft_bold
exec 'hi makeSpecTarget'  . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi makeStatement'   . s:fg_statement . s:bg_none . s:ft_none
exec 'hi makeComment'     . s:fg_comment   . s:bg_none . s:ft_italic
exec 'hi makeString'      . s:fg_green     . s:bg_none . s:ft_none
exec 'hi makeSpecial'     . s:fg_golden    . s:bg_none . s:ft_bold
" }}}

" --- TCL --- {{{
exec 'hi tclCommand'      . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi tclConditional'  . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi tclRepeat'       . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi tclKeyword'      . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi tclStatement'    . s:fg_statement . s:bg_none . s:ft_none
exec 'hi tclString'       . s:fg_green     . s:bg_none . s:ft_none
exec 'hi tclNumber'       . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi tclComment'      . s:fg_comment   . s:bg_none . s:ft_italic
exec 'hi tclVariable'     . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi tclProcCommand'  . s:fg_function  . s:bg_none . s:ft_none
exec 'hi tclOperator'     . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi tclSpecial'      . s:fg_green     . s:bg_none . s:ft_none
exec 'hi tclExpand'       . s:fg_crimson   . s:bg_none . s:ft_none
" }}}

" --- Shell / tcsh / csh / bash --- {{{
exec 'hi shStatement'    . s:fg_statement . s:bg_none . s:ft_none
exec 'hi shConditional'  . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi shLoop'         . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi shRepeat'       . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi shFunction'     . s:fg_function  . s:bg_none . s:ft_none
exec 'hi shCommandSub'   . s:fg_fg        . s:bg_none . s:ft_none
exec 'hi shComment'      . s:fg_comment   . s:bg_none . s:ft_italic
exec 'hi shString'       . s:fg_green     . s:bg_none . s:ft_none
exec 'hi shNumber'       . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi shVariable'     . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi shDeref'        . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi shOperator'     . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi shSpecial'      . s:fg_green     . s:bg_none . s:ft_none
exec 'hi shSet'          . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi shSetList'      . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi shQuote'        . s:fg_green     . s:bg_none . s:ft_none
exec 'hi shTestOpr'      . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi shOption'       . s:fg_fg        . s:bg_none . s:ft_none

exec 'hi cshStatement'   . s:fg_statement . s:bg_none . s:ft_none
exec 'hi cshComment'     . s:fg_comment   . s:bg_none . s:ft_italic
exec 'hi cshString'      . s:fg_green     . s:bg_none . s:ft_none
exec 'hi cshVariable'    . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi cshSetVariables'. s:fg_teal      . s:bg_none . s:ft_none
" }}}

" --- C / C++ --- {{{
exec 'hi cStatement'     . s:fg_statement . s:bg_none . s:ft_none
exec 'hi cConditional'   . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi cRepeat'        . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi cType'          . s:fg_purple   . s:bg_none . s:ft_bold
exec 'hi cStructure'     . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi cStorageClass'  . s:fg_purple   . s:bg_none . s:ft_bold
exec 'hi cConstant'      . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi cString'        . s:fg_green     . s:bg_none . s:ft_none
exec 'hi cNumber'        . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi cComment'       . s:fg_comment   . s:bg_none . s:ft_italic
exec 'hi cOperator'      . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi cPreProc'       . s:fg_crimson   . s:bg_none . s:ft_none
exec 'hi cInclude'       . s:fg_red       . s:bg_none . s:ft_none
exec 'hi cDefine'        . s:fg_crimson   . s:bg_none . s:ft_none
exec 'hi cPreCondit'     . s:fg_crimson   . s:bg_none . s:ft_none
exec 'hi cFunction'      . s:fg_function  . s:bg_none . s:ft_none

exec 'hi cppStatement'   . s:fg_statement . s:bg_none . s:ft_none
exec 'hi cppType'        . s:fg_purple   . s:bg_none . s:ft_bold
exec 'hi cppStructure'   . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi cppAccess'      . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi cppBoolean'     . s:fg_seaTeal   . s:bg_none . s:ft_bold
" }}}

" --- VimL --- {{{
exec 'hi vimCommand'     . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi vimHighlight'   . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi vimNotFunc'     . s:fg_magenta    . s:bg_none . s:ft_bold
exec 'hi vimGroup'       . s:fg_function  . s:bg_none . s:ft_none
exec 'hi vimHiGroup'     . s:fg_function  . s:bg_none . s:ft_none
exec 'hi vimFuncName'    . s:fg_function  . s:bg_none . s:ft_none
exec 'hi vimOption'      . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi vimString'      . s:fg_green     . s:bg_none . s:ft_none
exec 'hi vimVar'         . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi vimNumber'      . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi vimComment'     . s:fg_comment   . s:bg_none . s:ft_italic
exec 'hi vimLineComment' . s:fg_comment   . s:bg_none . s:ft_italic
exec 'hi vimMapModKey'   . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi vimNotation'    . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi vimOper'        . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi vimParenSep'    . s:fg_operator  . s:bg_none . s:ft_none
exec 'hi vimSep'         . s:fg_operator  . s:bg_none . s:ft_none
" }}}

" --- Markdown --- {{{
exec 'hi markdownHeadingDelimiter' . s:fg_blue     . s:bg_none . s:ft_bold
exec 'hi markdownH1'              . s:fg_blue     . s:bg_none . s:ft_bold
exec 'hi markdownH2'              . s:fg_blue     . s:bg_none . s:ft_bold
exec 'hi markdownH3'              . s:fg_magenta   . s:bg_none . s:ft_bold
exec 'hi markdownH4'              . s:fg_magenta   . s:bg_none . s:ft_bold
exec 'hi markdownH5'              . s:fg_operator . s:bg_none . s:ft_bold
exec 'hi markdownH6'              . s:fg_operator . s:bg_none . s:ft_bold
exec 'hi markdownBold'            . s:fg_fg       . s:bg_none . s:ft_bold
exec 'hi markdownItalic'          . s:fg_fg       . s:bg_none . s:ft_italic
exec 'hi markdownCode'            . s:fg_green    . s:bg_none . s:ft_none
exec 'hi markdownCodeBlock'       . s:fg_green    . s:bg_none . s:ft_none
exec 'hi markdownUrl'             . s:fg_operator . s:bg_none . s:ft_underline
exec 'hi markdownLinkText'        . s:fg_function . s:bg_none . s:ft_none
" }}}

" --- JSON / YAML --- {{{
exec 'hi jsonKeyword'       . s:fg_blue     . s:bg_none . s:ft_none
exec 'hi jsonString'        . s:fg_green    . s:bg_none . s:ft_none
exec 'hi jsonNumber'        . s:fg_golden   . s:bg_none . s:ft_bold
exec 'hi jsonBoolean'       . s:fg_seaTeal  . s:bg_none . s:ft_bold
exec 'hi jsonNull'          . s:fg_seaTeal  . s:bg_none . s:ft_bold
exec 'hi jsonBraces'        . s:fg_operator . s:bg_none . s:ft_none
exec 'hi jsonQuote'         . s:fg_operator . s:bg_none . s:ft_none

exec 'hi yamlKey'           . s:fg_blue     . s:bg_none . s:ft_none
exec 'hi yamlAnchor'        . s:fg_teal     . s:bg_none . s:ft_none
exec 'hi yamlAlias'         . s:fg_teal     . s:bg_none . s:ft_none
exec 'hi yamlFlowIndicator' . s:fg_operator . s:bg_none . s:ft_none
exec 'hi yamlBlockMappingKey' . s:fg_blue   . s:bg_none . s:ft_none
exec 'hi yamlFlowString'    . s:fg_green    . s:bg_none . s:ft_none
" }}}

" --- HTML / XML --- {{{
exec 'hi htmlTag'         . s:fg_operator . s:bg_none . s:ft_none
exec 'hi htmlEndTag'      . s:fg_operator . s:bg_none . s:ft_none
exec 'hi htmlTagName'     . s:fg_blue     . s:bg_none . s:ft_bold
exec 'hi htmlArg'         . s:fg_teal     . s:bg_none . s:ft_none
exec 'hi htmlString'      . s:fg_green    . s:bg_none . s:ft_none
exec 'hi htmlTitle'       . s:fg_fg       . s:bg_none . s:ft_bold
exec 'hi htmlH1'          . s:fg_blue     . s:bg_none . s:ft_bold

exec 'hi xmlTag'          . s:fg_operator . s:bg_none . s:ft_none
exec 'hi xmlEndTag'       . s:fg_operator . s:bg_none . s:ft_none
exec 'hi xmlTagName'      . s:fg_blue     . s:bg_none . s:ft_bold
exec 'hi xmlAttrib'       . s:fg_teal     . s:bg_none . s:ft_none
exec 'hi xmlString'       . s:fg_green    . s:bg_none . s:ft_none
" }}}

" --- CSS --- {{{
exec 'hi cssClassName'    . s:fg_function  . s:bg_none . s:ft_none
exec 'hi cssIdentifier'  . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi cssProp'         . s:fg_teal     . s:bg_none . s:ft_none
exec 'hi cssAttr'         . s:fg_golden   . s:bg_none . s:ft_bold
exec 'hi cssColor'        . s:fg_golden   . s:bg_none . s:ft_bold
exec 'hi cssValueNumber'  . s:fg_golden   . s:bg_none . s:ft_bold
exec 'hi cssBraces'       . s:fg_operator . s:bg_none . s:ft_none
" }}}

" --- JavaScript / TypeScript --- {{{
exec 'hi javaScriptFunction'   . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi javaScriptIdentifier' . s:fg_teal      . s:bg_none . s:ft_none
exec 'hi javaScriptNumber'     . s:fg_golden    . s:bg_none . s:ft_bold
exec 'hi javaScriptString'     . s:fg_green     . s:bg_none . s:ft_none
exec 'hi javaScriptBoolean'    . s:fg_seaTeal   . s:bg_none . s:ft_bold
exec 'hi javaScriptNull'       . s:fg_seaTeal   . s:bg_none . s:ft_bold
exec 'hi javaScriptBraces'     . s:fg_operator  . s:bg_none . s:ft_none

exec 'hi typescriptImport'     . s:fg_red       . s:bg_none . s:ft_none
exec 'hi typescriptExport'     . s:fg_red       . s:bg_none . s:ft_none
exec 'hi typescriptVariable'   . s:fg_blue      . s:bg_none . s:ft_bold
exec 'hi typescriptOperator'   . s:fg_operator  . s:bg_none . s:ft_none
" }}}

" --- Git --- {{{
exec 'hi gitcommitSummary'     . s:fg_fg       . s:bg_none . s:ft_none
exec 'hi gitcommitBranch'      . s:fg_function . s:bg_none . s:ft_bold
exec 'hi gitcommitComment'     . s:fg_comment  . s:bg_none . s:ft_italic
exec 'hi gitcommitSelectedType'. s:fg_green    . s:bg_none . s:ft_none
exec 'hi gitcommitSelectedFile'. s:fg_green    . s:bg_none . s:ft_none
exec 'hi gitcommitDiscardedType'. s:fg_error   . s:bg_none . s:ft_none
exec 'hi gitcommitDiscardedFile'. s:fg_error   . s:bg_none . s:ft_none
exec 'hi gitcommitUntrackedFile'. s:fg_golden  . s:bg_none . s:ft_bold
" }}}

" ============================================================================
" Plugin Support
" ============================================================================

" --- vim-gitgutter / vim-signify --- {{{
exec 'hi GitGutterAdd'          . s:fg_green    . s:bg_none . s:ft_bold
exec 'hi GitGutterChange'       . s:fg_operator . s:bg_none . s:ft_bold
exec 'hi GitGutterDelete'       . s:fg_error    . s:bg_none . s:ft_bold
exec 'hi GitGutterChangeDelete' . s:fg_golden   . s:bg_none . s:ft_bold
exec 'hi SignifySignAdd'        . s:fg_green    . s:bg_none . s:ft_bold
exec 'hi SignifySignChange'     . s:fg_operator . s:bg_none . s:ft_bold
exec 'hi SignifySignDelete'     . s:fg_error    . s:bg_none . s:ft_bold
" }}}

" --- NERDTree --- {{{
exec 'hi NERDTreeDir'       . s:fg_operator . s:bg_none . s:ft_bold
exec 'hi NERDTreeFile'      . s:fg_fg       . s:bg_none . s:ft_none
exec 'hi NERDTreeExecFile'  . s:fg_green    . s:bg_none . s:ft_none
exec 'hi NERDTreeOpenable'  . s:fg_operator . s:bg_none . s:ft_none
exec 'hi NERDTreeClosable'  . s:fg_operator . s:bg_none . s:ft_none
exec 'hi NERDTreeDirSlash'  . s:fg_operator . s:bg_none . s:ft_none
exec 'hi NERDTreeCWD'       . s:fg_blue     . s:bg_none . s:ft_bold
" }}}

" --- ALE / CoC / Neovim LSP diagnostics --- {{{
exec 'hi ALEError'             . s:fg_error   . s:bg_none    . s:sp_error   . s:ft_underline
exec 'hi ALEWarning'           . s:fg_golden  . s:bg_none    . s:sp_warning . s:ft_underline
exec 'hi ALEErrorSign'         . s:fg_error   . s:bg_none    . s:ft_bold
exec 'hi ALEWarningSign'       . s:fg_golden  . s:bg_none    . s:ft_bold

exec 'hi CocErrorSign'         . s:fg_error   . s:bg_none    . s:ft_bold
exec 'hi CocWarningSign'       . s:fg_golden  . s:bg_none    . s:ft_bold
exec 'hi CocInfoSign'          . s:fg_operator . s:bg_none   . s:ft_bold
exec 'hi CocHintSign'          . s:fg_seaTeal . s:bg_none    . s:ft_bold
exec 'hi CocErrorHighlight'    . s:fg_none    . s:bg_none    . s:sp_error   . s:ft_underline
exec 'hi CocWarningHighlight'  . s:fg_none    . s:bg_none    . s:sp_warning . s:ft_underline
exec 'hi CocFloating'          . s:fg_fg      . s:bg_pmenu   . s:ft_none

exec 'hi DiagnosticError'      . s:fg_error   . s:bg_none    . s:ft_none
exec 'hi DiagnosticWarn'       . s:fg_golden  . s:bg_none    . s:ft_none
exec 'hi DiagnosticInfo'       . s:fg_operator . s:bg_none   . s:ft_none
exec 'hi DiagnosticHint'       . s:fg_seaTeal . s:bg_none    . s:ft_none
exec 'hi DiagnosticUnderlineError' . s:fg_none . s:bg_none   . s:sp_error   . s:ft_underline
exec 'hi DiagnosticUnderlineWarn'  . s:fg_none . s:bg_none   . s:sp_warning . s:ft_underline
exec 'hi DiagnosticUnderlineInfo'  . s:fg_none . s:bg_none   . s:sp_info    . s:ft_underline
exec 'hi DiagnosticUnderlineHint'  . s:fg_none . s:bg_none   . s:sp_info    . s:ft_underline
" }}}

" --- IndentGuides --- {{{
exec 'hi IndentGuidesOdd'  . s:fg_none . s:bg_none   . s:ft_none
exec 'hi IndentGuidesEven' . s:fg_none . s:bg_cursor  . s:ft_none
" }}}

" --- vim-startify --- {{{
exec 'hi StartifyFile'    . s:fg_fg       . s:bg_none . s:ft_none
exec 'hi StartifyNumber'  . s:fg_golden   . s:bg_none . s:ft_bold
exec 'hi StartifyHeader'  . s:fg_comment  . s:bg_none . s:ft_italic
exec 'hi StartifySection' . s:fg_blue     . s:bg_none . s:ft_bold
exec 'hi StartifyPath'    . s:fg_comment  . s:bg_none . s:ft_none
exec 'hi StartifySlash'   . s:fg_comment  . s:bg_none . s:ft_none
exec 'hi StartifyBracket' . s:fg_operator . s:bg_none . s:ft_none
" }}}

" --- Tagbar --- {{{
exec 'hi TagbarKind'      . s:fg_blue     . s:bg_none . s:ft_bold
exec 'hi TagbarSignature' . s:fg_comment  . s:bg_none . s:ft_italic
exec 'hi TagbarScope'     . s:fg_purple  . s:bg_none . s:ft_bold
" }}}

" vim: set fdm=marker fmr={{{,}}} :
