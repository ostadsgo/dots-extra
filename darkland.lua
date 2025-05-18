vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

-- color name
vim.g.colors_name = "darkland"

-- colors
local bg = "#000000"
local black = "#191919"
local fg = "#b8b8b8"
local white = "#ebebeb"
local red = "#984936"
local blue = "#708090"
local green = "#3A5F3A"
local dark_gray = "#333333"
local mid_gray = "#454545"
local light_gray = "#696969"

-- hi
local function hi(group, hl)
  vim.api.nvim_set_hl(0, group, hl)
end

-- Custom Groups
hi("Prim", {fg = green, bg=nil})
hi("White", {fg = white, bg=nil})
hi("Red", {fg = red, bg=nil})
hi("LightGray", {fg = light_gray, bg=nil})
hi("DarkGray", {fg = dark_gray, bg=nil})
hi("MidGray", {fg = mid_gray, bg=nil})
hi("Accent", {fg = blue, bg=nil})
hi("Kw", {fg = light_gray, bg=nil})
hi("Popup", {fg = fg, bg=black})
hi("Sel", {fg = fg, bg=red})
hi("Line", {fg = fg, bg=black})
hi("InAcLine", {fg = mid_gray, bg=black})

hi("Normal", { fg = fg })
hi("Error", { bg = red })
hi("MatchParen", { fg = white, bg = nil } )
hi("LineNr", { link = "MidGray" })

hi("Todo", { link = "Sel" } )
hi("IncSearch", { link = "Sel" } )

hi("Comment", { link = "Accent" } )
hi("SpecialComment", { link = "Comment" })

hi("String", { link = "Prim" }) 

hi("Constant", { link = "Normal" })
hi("Character", { link = "Normal" })
hi("Number", { link = "Normal" })
hi("Boolean", { link = "Normal" })
hi("Float", { link = "Normal" })

hi("Identifier", { link = "Normal" })  
hi("Function", { link = "White" })   
hi("Statement", { link = "LightGray" })
hi("Conditional", { link = "LightGray" })
hi("Repeat", { link = "LightGray" })	
hi("Label", { link = "LightGray" })  
hi("Operator", { link = "LightGray" })
hi("Keyword", { link = "LightGray" })
hi("Exception", { link = "LightGray" })

hi("Identifier", { link = "Normal" })
hi("Function", { link = "White" })
hi("Statement", { link = "LightGray" })
hi("Conditional", { link = "LightGray" })
hi("Repeat", { link = "LightGray" })	
hi("Label", { link = "LightGray" })
hi("Operator", { link = "LightGray" })
hi("Keyword", { link = "LightGray" })
hi("Exception", { link = "LightGray" })

hi("PreProc", { link = "LightGray" })
hi("Include", { link = "LightGray" })
hi("Define", { link = "LightGray" })
hi("Macro", { link = "LightGray" })
hi("PreCondit", { link = "LightGray" }) 

hi("Type", { link = "LightGray" })
hi("StorageClass", { link = "LightGray" })
hi("Structure", { link = "LightGray" })
hi("Typedef", { link = "LightGray" })

hi("Special", { link = "LightGray" })
hi("SpecialChar", { link = "LightGray" })
hi("Tag", { link = "LightGray" }) 
hi("Delimiter", { link = "LightGray" })
hi("Debug", { link = "Red" })

hi("Underlined", { link = "Red" })  

hi("Added", { link = "Red" })
hi("Changed", { link = "Red" })
hi("Removed", { link = "Red" })

hi("Cursor", { link = "Black" })
hi("CursorColumn", { link = "DarkGray" })
hi("ColorColumn", { link = "DarkGray" })
hi("Conceal", { link = "Normal" })
hi("lCursor", { link = "Black" })
hi("CursorIM", { link = "Black" })
hi("CursorLine", { link = "Line" })
hi("Directory", { link = "Accent" })
hi("DiffAdd", { link = "Green" })
hi("DiffChange", { link = "Green" })
hi("DiffDelete", { link = "Red" })
hi("DiffText", { link = "Normal" })
hi("DiffTextAdd", { link = "Green" })

hi("ErrorMsg", { link = "Red" })
hi("VertSplit", { link = "Red" })
hi("Folded", { link = "Normal" })
hi("FoldColumn", { link = "Normal" })
hi("SignColumn", { link = "Normal" })
hi("LineNrAbove", { link = "MidGray" })
hi("LineNrBelow", { link = "MidGray" })
hi("CursorLineNr", { link = "Normal" })
hi("CursorLineFold", { link = "Normal" })
hi("CursorLineSign", { link = "Normal" })
hi("MessageWindow", { link = "Red" })
hi("ModeMsg", { link = "Normal" })
hi("MsgArea", { link = "Normal" })
hi("MoreMsg", { link = "Normal" })

hi("Pmenu", { link = "Popup" })
hi("PmenuSel", { link = "Sel" })
hi("PmenuKind", { link = "Normal" })
hi("PmenuKindSel", { link = "Red" })
hi("PmenuExtra", { link = "Normal" })
hi("PmenuExtraSel", { link = "Normal" })
hi("PmenuSbar", { link = "Normal" })
hi("PmenuThumb", { link = "Normal" })
hi("PmenuMatch", { link = "White" })
hi("PmenuMatchSel", { link = "Normal" })
hi("ComplMatchIns", { link = "Normal" })
hi("PopupSelected", { link = "Normal" })
hi("Question", { link = "Normal" })
hi("QuickFixLine", { link = "Normal" })
hi("Search", { link = "Sel" })
hi("CurSearch", { link = "Normal" })
hi("SpecialKey", { link = "Normal" })
hi("SpellBad", { link = "Red" })
hi("SpellCap", { link = "Normal" })
hi("SpellLocal", { link = "Normal" })
hi("SpellRare", { link = "Normal" })

hi("StatusLine", { link = "Line" })
hi("StatusLineNC", { link = "InAcLine" })
hi("StatusLineTerm", { link = "Normal" })
hi("StatusLineTermNC", { link = "Normal" })
hi("TabLine", { link = "Line" })
hi("TabLineFill", { link = "Normal" })
hi("TabLineSel", { link = "Sel" })
hi("TabPanel", { link = "Normal" })
hi("TabPanelFill", { link = "Normal" })
hi("TabPanelSel", { link = "Normal" })
hi("Terminal", { link = "Normal" })
hi("Title", { link = "Normal" })
hi("Visual", { link = "Sel" })
hi("VisualNOS", { link = "Normal" })
hi("WarningMsg", { link = "Normal" })
hi("WildMenu", { link = "Sel" })

-- HTML
hi("htmlTag", { link = "LightGray" })
hi("htmlEndTag", { link = "LightGray" })

-- Mini Picker
--
