" Name:         darkland
" Description:  Dark minimal colorscheme
" Author:       Saeed Gholami <saeed.ghollami@gmail.com>
" Maintainer:   Saeed Gholami <saeed.ghollami@gmail.com>
" Website:      https://ostadgso.github.io
" License:      Same as Vim
" Last Change:  2025 Jan 07

" 0: black   - background
" 1: red     - Warnning
" 2: green   - primary
" 3: yellow  - dark gray
" 4: blue    - Accent
" 5: magenta - Gray
" 6: cyan    - Light Gray
" 7: Gray    - Foreground
"
" 8: Dark
" 9: red     : error
" 15: white  : Anit flash white
"

" Base colors
hi! Balck      cterm=NONE    ctermfg=0    ctermbg=NONE
hi! Red        cterm=NONE    ctermfg=1    ctermbg=NONE
hi! Green      cterm=NONE    ctermfg=2    ctermbg=NONE
hi! Yellow     cterm=NONE    ctermfg=3    ctermbg=NONE
hi! Blue       cterm=NONE    ctermfg=4    ctermbg=NONE
hi! Magenta    cterm=NONE    ctermfg=5    ctermbg=NONE
hi! Cyan       cterm=NONE    ctermfg=6    ctermbg=NONE
hi! Gray       cterm=NONE    ctermfg=7    ctermbg=NONE

" Accent colors 
hi! AltBlack   cterm=NONE    ctermfg=8    ctermbg=NONE
hi! White      cterm=NONE    ctermfg=15   ctermbg=NONE

hi! link Primary    Green 
hi! link Accent     Blue
hi! link DarkGray   Yellow
hi! link MidGray    Magenta
hi! link LightGray  Cyan

hi! Normal     cterm=NONE    ctermfg=7    ctermbg=NONE
hi! Sel        cterm=NONE    ctermfg=7    ctermbg=1
hi! Line       cterm=NONE    ctermfg=7    ctermbg=8
hi! InAcLine   cterm=NONE    ctermfg=5    ctermbg=8
hi! Popup      cterm=NONE    ctermfg=7    ctermbg=8
hi! Null       cterm=NONE    ctermfg=NONE ctermbg=NONE

" Hi Groups
hi! link Todo       Sel
hi! link IncSearch  Sel

hi! link MatchParen  Normal
hi! link LineNr      DarkGray

hi! link Comment         Accent
hi! link SpecialComment  Primary
hi! link Error           Red

hi! link Constant   Normal
hi! link String     Primary 
hi! link Character  Normal
hi! link Number     Normal
hi! link Boolean    Normal
hi! link Float      Normal

hi! link Identifier  Normal  " any variable name
hi! link Function    White   " function name (also: methods for classes)
hi! link Statement   LightGray
hi! link Conditional LightGray
hi! link Repeat      LightGray	
hi! link Label       LightGray  " case default ect
hi! link Operator    LightGray
hi! link Keyword     LightGray
hi! link Exception   LightGray

hi! link PreProc      LightGray
hi! link Include      LightGray
hi! link Define       LightGray
hi! link Macro        LightGray
hi! link PreCondit    LightGray  " #if #else

hi! link Type         LightGray
hi! link StorageClass LightGray  " static, register, volatile, etc.
hi! link Structure    LightGray
hi! link Typedef      LightGray

hi! link Special      LightGray
hi! link SpecialChar  LightGray
hi! link Tag          LightGray 
hi! link Delimiter    LightGray
hi! link Debug        Red

hi! link Underlined   Red  " text that stands out, HTML links

hi! link Added        Red
hi! link Changed      Red
hi! link Removed      Red

hi! link Cursor          Black
hi! link CursorColumn    DarkGray
hi! link ColorColumn     DarkGray
hi! link Conceal         Normal
hi! link lCursor         Black
hi! link CursorIM        Black
hi! link CursorLine      Line
hi! link Directory       Accent
hi! link DiffAdd         Green
hi! link DiffChange      Green
hi! link DiffDelete      Red
hi! link DiffText        Normal
hi! link DiffTextAdd     Green

hi! link ErrorMsg        Red
hi! link VertSplit       Red
hi! link Folded          Normal
hi! link FoldColumn      Normal
hi! link SignColumn      Normal
hi! link LineNrAbove     Normal
hi! link LineNrBelow     Normal
hi! link CursorLineNr    Normal
hi! link CursorLineFold  Normal
hi! link CursorLineSign  Normal
hi! link MessageWindow   Red
hi! link ModeMsg         Normal
hi! link MsgArea         Normal
hi! link MoreMsg         Normal

hi! link Pmenu           Popup
hi! link PmenuSel        Sel
hi! link PmenuKind       Normal
hi! link PmenuKindSel    Red
hi! link PmenuExtra      Normal
hi! link PmenuExtraSel   Normal
hi! link PmenuSbar       Normal
hi! link PmenuThumb      Normal
hi! link PmenuMatch      White
hi! link PmenuMatchSel   Normal
hi! link ComplMatchIns   Normal
hi! link PopupSelected   Normal
hi! link Question        Normal
hi! link QuickFixLine    Normal
hi! link Search          Normal
hi! link CurSearch       Normal
hi! link SpecialKey      Normal
hi! link SpellBad        Red
hi! link SpellCap        Normal
hi! link SpellLocal      Normal
hi! link SpellRare       Normal

hi! link StatusLine       Line
hi! link StatusLineNC     InAcLine
hi! link StatusLineTerm   Normal
hi! link StatusLineTermNC Normal
hi! link TabLine          Line
hi! link TabLineFill      Normal
hi! link TabLineSel       Sel
hi! link TabPanel         Normal
hi! link TabPanelFill     Normal
hi! link TabPanelSel      Normal
hi! link Terminal         Normal
hi! link Title            Normal
hi! link Visual           Sel
hi! link VisualNOS        Normal
hi! link WarningMsg       Normal
hi! link WildMenu         Sel

" HTML
hi! link htmlTag        LightGray
hi! link htmlEndTag     LightGray
