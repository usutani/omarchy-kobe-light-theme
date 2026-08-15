vim.g.colors_name = "kobe-light"
vim.o.background = "light"

local set = vim.api.nvim_set_hl

-- ============================================================================
-- Editor chrome
-- ============================================================================
set(0, "Normal",       { fg = "#3B3B3B", bg = "#FFFFFF" })
set(0, "NormalFloat",  { fg = "#3B3B3B", bg = "#F8F8F8" })
set(0, "NormalSB",     { fg = "#3B3B3B", bg = "#F8F8F8" })
set(0, "NormalNC",     { fg = "#3B3B3B", bg = "#F8F8F8" })
set(0, "EndOfBuffer",  { fg = "#FFFFFF", bg = "#FFFFFF" })
set(0, "Cursor",       { fg = "#FFFFFF", bg = "#000000" })
set(0, "CursorColumn", { bg = "#F2F2F2" })
set(0, "CursorLine",   { bg = "#F2F2F2" })
set(0, "LineNr",       { fg = "#6E7681" })
set(0, "LineNrAbove",  { fg = "#6E7681" })
set(0, "LineNrBelow",  { fg = "#6E7681" })
set(0, "CursorLineNr", { fg = "#171184" })
set(0, "ColorColumn",  { bg = "#F2F2F2" })
set(0, "SignColumn",   { bg = "#FFFFFF" })
set(0, "FoldColumn",   { fg = "#6E7681", bg = "#FFFFFF" })
set(0, "Folded",       { fg = "#3B3B3B", bg = "#F2F2F2" })
set(0, "Visual",       { bg = "#ADD6FF" })
set(0, "VisualNOS",    { bg = "#E5EBF1" })
set(0, "Search",       { bg = "#F8C9AA" })
set(0, "IncSearch",    { bg = "#A8AC94", fg = "#3B3B3B" })
set(0, "CurSearch",    { bg = "#A8AC94", fg = "#3B3B3B" })
set(0, "MatchParen",   { bg = "#ADD6FF", bold = true })
set(0, "Conceal",      { fg = "#008000" })

-- Spelunker / spell
set(0, "SpellBad",     { undercurl = true, sp = "#F85149" })
set(0, "SpellCap",     { undercurl = true, sp = "#005FB8" })
set(0, "SpellLocal",   { undercurl = true, sp = "#098658" })
set(0, "SpellRare",    { undercurl = true, sp = "#AF00DB" })

-- ============================================================================
-- UI chrome (tabs, statusline, windows)
-- ============================================================================
set(0, "TabLine",      { fg = "#3B3B3B", bg = "#F8F8F8" })
set(0, "TabLineFill",  { bg = "#F8F8F8" })
set(0, "TabLineSel",   { fg = "#005FB8", bg = "#FFFFFF", bold = true })
set(0, "WinSeparator", { fg = "#005FB8" })
set(0, "StatusLine",   { fg = "#3B3B3B", bg = "#F8F8F8" })
set(0, "StatusLineNC", { fg = "#6E7681", bg = "#F8F8F8" })
set(0, "WinBar",       { fg = "#3B3B3B", bg = "#F8F8F8" })
set(0, "WinBarNC",     { fg = "#6E7681", bg = "#F8F8F8" })
set(0, "Title",        { fg = "#005FB8", bold = true })

-- Popup menu
set(0, "Pmenu",        { fg = "#3B3B3B", bg = "#F8F8F8" })
set(0, "PmenuSel",     { bg = "#BED6ED", fg = "#3B3B3B" })
set(0, "PmenuSbar",    { bg = "#CCCCCC" })
set(0, "PmenuThumb",   { bg = "#CCCCCC" })
set(0, "FloatBorder",  { fg = "#005FB8" })
set(0, "FloatTitle",   { fg = "#005FB8", bold = true })

-- Message area
set(0, "MsgArea",      { fg = "#3B3B3B", bg = "#FFFFFF" })
set(0, "ModeMsg",      { fg = "#3B3B3B", bold = true })

-- ============================================================================
-- Diff
-- ============================================================================
set(0, "DiffAdd",      { fg = "#2EA043", bg = "#FFFFFF" })
set(0, "DiffDelete",   { fg = "#F85149", bg = "#FFFFFF" })
set(0, "DiffChange",   { fg = "#005FB8", bg = "#FFFFFF" })
set(0, "DiffText",     { fg = "#005FB8", bg = "#F2F2F2" })

-- ============================================================================
-- Standard syntax groups
-- ============================================================================
set(0, "Comment",      { fg = "#008000", italic = true })
set(0, "Constant",     { fg = "#0070C1" })
set(0, "String",       { fg = "#A31515" })
set(0, "Character",    { fg = "#A31515" })
set(0, "Number",       { fg = "#098658" })
set(0, "Boolean",      { fg = "#0000FF" })
set(0, "Float",        { fg = "#098658" })
set(0, "Identifier",   { fg = "#001080" })
set(0, "Function",     { fg = "#795E26" })
set(0, "Statement",    { fg = "#0000FF" })
set(0, "Conditional",  { fg = "#0000FF" })
set(0, "Repeat",       { fg = "#0000FF" })
set(0, "Label",        { fg = "#0000FF" })
set(0, "Operator",     { fg = "#000000" })
set(0, "Keyword",      { fg = "#0000FF" })
set(0, "Exception",    { fg = "#0000FF" })
set(0, "PreProc",      { fg = "#0000FF" })
set(0, "Include",      { fg = "#0000FF" })
set(0, "Define",       { fg = "#0000FF" })
set(0, "Macro",        { fg = "#0000FF" })
set(0, "PreCondit",    { fg = "#0000FF" })
set(0, "Type",         { fg = "#267F99" })
set(0, "StorageClass", { fg = "#0000FF" })
set(0, "Structure",    { fg = "#267F99" })
set(0, "Typedef",      { fg = "#267F99" })
set(0, "Special",      { fg = "#0000FF" })
set(0, "SpecialChar",  { fg = "#EE0000" })
set(0, "Tag",          { fg = "#800000" })
set(0, "Delimiter",    { fg = "#800000" })
set(0, "SpecialComment", { fg = "#008000", italic = true })
set(0, "Debug",        { fg = "#A31515" })
set(0, "Underlined",   { underline = true, sp = "#0000FF" })
set(0, "Ignore",       { fg = "#6E7681" })
set(0, "Error",        { fg = "#CD3131" })
set(0, "Todo",         { fg = "#008000", bg = "#FFFFFF", bold = true })

-- ============================================================================
-- Treesitter standard captures (hlgroups)
-- ============================================================================
set(0, "@comment",            { fg = "#008000", italic = true })
set(0, "@string",             { fg = "#A31515" })
set(0, "@string.escape",      { fg = "#EE0000" })
set(0, "@string.regex",       { fg = "#EE0000" })
set(0, "@number",             { fg = "#098658" })
set(0, "@number.float",       { link = "@number" })
set(0, "@boolean",            { fg = "#0000FF" })
set(0, "@keyword",            { fg = "#0000FF" })
set(0, "@keyword.function",   { fg = "#0000FF" })
set(0, "@keyword.conditional", { fg = "#AF00DB" })
set(0, "@keyword.exception",   { fg = "#AF00DB" })
set(0, "@keyword.operator",   { fg = "#000000" })
set(0, "@keyword.return",     { fg = "#AF00DB" })
set(0, "@keyword.modifier",   { fg = "#0000FF" })
set(0, "@keyword.repeat",     { fg = "#AF00DB" })
set(0, "@operator",           { fg = "#000000" })
set(0, "@function",           { fg = "#795E26" })
set(0, "@function.builtin",   { fg = "#795E26" })
set(0, "@function.macro",     { fg = "#795E26" })
set(0, "@function.method",    { fg = "#795E26" })
set(0, "@parameter",          { fg = "#001080" })
set(0, "@variable",           { fg = "#001080" })
set(0, "@variable.builtin",   { fg = "#0000FF" })
set(0, "@constant",           { fg = "#0070C1" })
set(0, "@constant.builtin",   { fg = "#0000FF" })
set(0, "@constant.macro",     { fg = "#0070C1" })
set(0, "@type",               { fg = "#267F99" })
set(0, "@type.builtin",       { fg = "#267F99" })
set(0, "@type.qualifier",     { fg = "#0000FF" })
set(0, "@property",           { fg = "#E50000" })
set(0, "@tag",                { fg = "#800000" })
set(0, "@tag.attribute",      { fg = "#E50000" })
set(0, "@tag.delimiter",      { fg = "#800000" })
set(0, "@attribute",          { fg = "#E50000" })
set(0, "@preproc",            { fg = "#0000FF" })
set(0, "@punctuation.delimiter", { fg = "#3B3B3B" })
set(0, "@punctuation.bracket",   { fg = "#800000" })
set(0, "@punctuation.special",   { fg = "#AF00DB" })
set(0, "@markup.heading",     { fg = "#800000", bold = true })
set(0, "@markup.strong",      { fg = "#000080", bold = true })
set(0, "@markup.italic",      { fg = "#800080", italic = true })
set(0, "@markup.strikethrough", { strikethrough = true })
set(0, "@markup.underline",   { underline = true })
set(0, "@markup.link",        { fg = "#0000FF", underline = true })
set(0, "@markup.list",        { fg = "#800000" })
set(0, "@markup.raw",         { fg = "#A31515" })
set(0, "@diff.plus",          { fg = "#098658" })
set(0, "@diff.minus",         { fg = "#A31515" })
set(0, "@diff.change",        { fg = "#0451A5" })
set(0, "@lsp.type.class",     { link = "@type" })
set(0, "@lsp.type.comment",   { link = "@comment" })
set(0, "@lsp.type.enum",      { link = "@type" })
set(0, "@lsp.type.function",  { link = "@function" })
set(0, "@lsp.type.interface", { link = "@type" })
set(0, "@lsp.type.keyword",   { link = "@keyword" })
set(0, "@lsp.type.method",    { link = "@function.method" })
set(0, "@lsp.type.namespace", { fg = "#267F99" })
set(0, "@lsp.type.parameter", { link = "@parameter" })
set(0, "@lsp.type.property",  { link = "@property" })
set(0, "@lsp.type.struct",    { link = "@type" })
set(0, "@lsp.type.type",      { link = "@type" })
set(0, "@lsp.type.variable",  { link = "@variable" })

-- ============================================================================
-- Semantic token overrides (from light_plus.json)
-- ============================================================================
set(0, "@lsp.mod.builtin",       { bold = true })
set(0, "@lsp.mod.readonly",     { italic = true })

-- ============================================================================
-- Diagnostic
-- ============================================================================
set(0, "DiagnosticError",       { fg = "#F85149" })
set(0, "DiagnosticWarn",        { fg = "#949800" })
set(0, "DiagnosticInfo",        { fg = "#005FB8" })
set(0, "DiagnosticHint",        { fg = "#005FB8" })
set(0, "DiagnosticOk",          { fg = "#098658" })
set(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#F85149" })
set(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = "#949800" })
set(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = "#005FB8" })
set(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = "#005FB8" })
set(0, "DiagnosticSignError",   { fg = "#F85149" })
set(0, "DiagnosticSignWarn",    { fg = "#949800" })
set(0, "DiagnosticSignInfo",    { fg = "#005FB8" })
set(0, "DiagnosticSignHint",    { fg = "#005FB8" })
set(0, "DiagnosticFloatingError", { fg = "#F85149" })
set(0, "DiagnosticFloatingWarn",  { fg = "#949800" })
set(0, "DiagnosticFloatingInfo",  { fg = "#005FB8" })
set(0, "DiagnosticFloatingHint",  { fg = "#005FB8" })
set(0, "DiagnosticVirtualTextError", { fg = "#F85149" })
set(0, "DiagnosticVirtualTextWarn",  { fg = "#949800" })
set(0, "DiagnosticVirtualTextInfo",  { fg = "#005FB8" })
set(0, "DiagnosticVirtualTextHint",  { fg = "#005FB8" })

-- ============================================================================
-- Git signs (gitsigns.nvim / vim-fugitive)
-- ============================================================================
set(0, "GitSignsAdd",           { fg = "#2EA043" })
set(0, "GitSignsDelete",        { fg = "#F85149" })
set(0, "GitSignsChange",        { fg = "#005FB8" })
set(0, "GitSignsAddLn",         { bg = "#2EA043" })
set(0, "GitSignsDeleteLn",      { bg = "#F85149" })
set(0, "GitSignsChangeLn",      { bg = "#005FB8" })

-- fugitive
set(0, "diffAdded",            { fg = "#098658" })
set(0, "diffRemoved",          { fg = "#A31515" })
set(0, "diffChanged",          { fg = "#0451A5" })
set(0, "diffFile",             { fg = "#0000FF" })
set(0, "diffNewFile",          { fg = "#0070C1" })
set(0, "diffLine",             { fg = "#267F99" })

-- ============================================================================
-- Lazy.nvim
-- ============================================================================
set(0, "LazyH1",            { bg = "#005FB8", fg = "#FFFFFF", bold = true })
set(0, "LazyH2",            { fg = "#005FB8", bold = true })
set(0, "LazyButton",        { bg = "#E5E5E5", fg = "#3B3B3B" })
set(0, "LazyButtonActive",  { bg = "#005FB8", fg = "#FFFFFF" })
set(0, "LazySpecial",       { fg = "#BC05BC" })
set(0, "LazyCommit",        { fg = "#005FB8" })
set(0, "LazyCommitType",    { fg = "#949800" })
set(0, "LazyCommitScope",   { fg = "#CD3131", italic = true })
set(0, "LazyProgressDone",  { fg = "#005FB8" })
set(0, "LazyProgressTodo",  { fg = "#D3D3D3" })
set(0, "LazyDimmed",        { fg = "#008000" })
set(0, "LazyProp",          { fg = "#6E7681" })
set(0, "LazyValue",         { fg = "#A31515" })
set(0, "LazyError",         { fg = "#CD3131" })
set(0, "LazyWarning",       { fg = "#949800" })
set(0, "LazyInfo",          { fg = "#005FB8" })

-- ============================================================================
-- Snacks.nvim Dashboard
-- ============================================================================
set(0, "SnacksDashboardHeader", { fg = "#005FB8", bold = true })
set(0, "SnacksDashboardIcon",   { fg = "#005FB8" })
set(0, "SnacksDashboardKey",    { fg = "#005FB8", bold = true })
set(0, "SnacksDashboardDesc",   { fg = "#3B3B3B" })
set(0, "SnacksDashboardFooter", { fg = "#005FB8" })

-- ============================================================================
-- LSP / nvim-cmp
-- ============================================================================
set(0, "CmpItemAbbrDeprecated", { fg = "#6E7681", strikethrough = true })
set(0, "CmpItemAbbrMatch",     { fg = "#005FB8", bold = true })
set(0, "CmpItemAbbrMatchFuzzy", { fg = "#005FB8", bold = true })
set(0, "CmpItemKindClass",     { fg = "#267F99" })
set(0, "CmpItemKindFunction",  { fg = "#795E26" })
set(0, "CmpItemKindInterface", { fg = "#267F99" })
set(0, "CmpItemKindKeyword",   { fg = "#0000FF" })
set(0, "CmpItemKindMethod",    { fg = "#795E26" })
set(0, "CmpItemKindSnippet",   { fg = "#AF00DB" })
set(0, "CmpItemKindText",      { fg = "#001080" })
set(0, "CmpItemKindValue",     { fg = "#098658" })
set(0, "CmpItemKindVariable",  { fg = "#001080" })

-- ============================================================================
-- Telescope
-- ============================================================================
set(0, "TelescopeNormal",       { fg = "#3B3B3B", bg = "#FFFFFF" })
set(0, "TelescopeBorder",       { fg = "#005FB8" })
set(0, "TelescopeSelection",    { bg = "#E8E8E8", fg = "#3B3B3B" })
set(0, "TelescopeMatching",     { fg = "#005FB8", bold = true })

-- ============================================================================
-- Which-key
-- ============================================================================
set(0, "WhichKey",              { fg = "#005FB8", bold = true })
set(0, "WhichKeyGroup",         { fg = "#0000FF" })
set(0, "WhichKeyDesc",          { fg = "#3B3B3B" })
set(0, "WhichKeySeparator",     { fg = "#6E7681" })
set(0, "WhichKeyFloat",         { bg = "#F8F8F8" })

-- ============================================================================
-- Notify / Noice
-- ============================================================================
set(0, "NoiceMsgArea",          { bg = "#FFFFFF" })
set(0, "NotifyBackground",      { bg = "#FFFFFF" })
set(0, "NotifyERRORBorder",     { fg = "#F85149" })
set(0, "NotifyWARNBorder",      { fg = "#949800" })
set(0, "NotifyINFOBorder",      { fg = "#005FB8" })
set(0, "NotifyDEBUGBorder",     { fg = "#6E7681" })
set(0, "NotifyTRACEBorder",     { fg = "#D3D3D3" })

-- ============================================================================
-- Terminal / misc
-- ============================================================================
set(0, "TermCursor",            { fg = "#FFFFFF", bg = "#000000" })
set(0, "healthError",           { fg = "#CD3131" })
set(0, "healthSuccess",         { fg = "#107C10" })
set(0, "healthWarning",         { fg = "#949800" })
