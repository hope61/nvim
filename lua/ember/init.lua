-- ember — the Ghostty/zsh ember theme as a Neovim colorscheme.
--
-- Local, not a plugin: the palette is shared with two other programs, so it
-- lives next to them rather than behind a version pin.
--
-- Transparency is on by default to match `background-opacity = 0.7` in the
-- Ghostty config. Set `vim.g.ember_transparent = false` before
-- `:colorscheme ember` to paint an opaque background instead.

local M = {}

local p = require 'ember.palette'

function M.load()
  local transparent = vim.g.ember_transparent
  if transparent == nil then
    transparent = true
  end

  -- nil background = the terminal shows through. Floats stay opaque either
  -- way: text stacked over text at 0.7 opacity is unreadable.
  local bg = transparent and 'NONE' or p.bg

  local hl = {
    -- ── editor chrome ────────────────────────────────────────────────
    Normal = { fg = p.fg, bg = bg },
    NormalNC = { fg = p.fg, bg = bg },
    NormalFloat = { fg = p.fg, bg = p.surface },
    FloatBorder = { fg = p.divider, bg = p.surface },
    FloatTitle = { fg = p.br_red, bg = p.surface, bold = true },
    Cursor = { fg = p.bg, bg = p.cursor },
    lCursor = { fg = p.bg, bg = p.cursor },
    TermCursor = { fg = p.bg, bg = p.cursor },
    CursorLine = { bg = p.line },
    CursorColumn = { bg = p.line },
    ColorColumn = { bg = p.line },
    -- Absolute number for the current line only; relative numbers stay dim,
    -- which is what makes a relative ruler scannable at a glance.
    LineNr = { fg = p.dim },
    CursorLineNr = { fg = p.br_red, bold = true },
    SignColumn = { bg = bg },
    FoldColumn = { fg = p.dim, bg = bg },
    Folded = { fg = p.br_black, bg = p.line },
    VertSplit = { fg = p.divider },
    WinSeparator = { fg = p.divider },
    EndOfBuffer = { fg = p.bg },
    Visual = { bg = p.sel_bg },
    VisualNOS = { bg = p.sel_bg },
    MatchParen = { fg = p.br_red, bold = true },
    Whitespace = { fg = p.black },
    NonText = { fg = p.black },
    SpecialKey = { fg = p.black },
    Conceal = { fg = p.br_black },
    Directory = { fg = p.br_yellow },
    Title = { fg = p.br_red, bold = true },
    Question = { fg = p.br_green },
    MoreMsg = { fg = p.br_green },
    ModeMsg = { fg = p.white, bold = true },
    ErrorMsg = { fg = p.br_red, bold = true },
    WarningMsg = { fg = p.br_yellow },
    MsgArea = { fg = p.fg },
    MsgSeparator = { fg = p.divider },
    QuickFixLine = { bg = p.sel_bg },
    Winbar = { fg = p.br_black, bg = bg },
    WinbarNC = { fg = p.black, bg = bg },

    -- ── search ───────────────────────────────────────────────────────
    -- Search is a wash; IncSearch/CurSearch invert so the one match you
    -- are standing on is never ambiguous among the others.
    Search = { fg = p.br_white, bg = '#5a2a22' },
    IncSearch = { fg = p.bg, bg = p.br_red },
    CurSearch = { fg = p.bg, bg = p.br_red },
    Substitute = { fg = p.bg, bg = p.br_yellow },

    -- ── statusline / tabs ────────────────────────────────────────────
    StatusLine = { fg = p.white, bg = p.overlay },
    StatusLineNC = { fg = p.br_black, bg = p.line },
    TabLine = { fg = p.br_black, bg = p.line },
    TabLineFill = { bg = bg },
    TabLineSel = { fg = p.br_white, bg = p.overlay, bold = true },

    -- ── completion menu ──────────────────────────────────────────────
    Pmenu = { fg = p.white, bg = p.surface },
    PmenuSel = { fg = p.br_white, bg = p.sel_bg, bold = true },
    PmenuKind = { fg = p.br_cyan, bg = p.surface },
    PmenuKindSel = { fg = p.br_cyan, bg = p.sel_bg },
    PmenuExtra = { fg = p.br_black, bg = p.surface },
    PmenuExtraSel = { fg = p.white, bg = p.sel_bg },
    PmenuSbar = { bg = p.surface },
    PmenuThumb = { bg = p.black },
    WildMenu = { fg = p.br_white, bg = p.sel_bg },

    -- ── spelling ─────────────────────────────────────────────────────
    SpellBad = { sp = p.br_red, undercurl = true },
    SpellCap = { sp = p.br_yellow, undercurl = true },
    SpellLocal = { sp = p.br_cyan, undercurl = true },
    SpellRare = { sp = p.br_magenta, undercurl = true },

    -- ── diff ─────────────────────────────────────────────────────────
    DiffAdd = { bg = p.diff_add },
    DiffDelete = { fg = p.red, bg = p.diff_del },
    DiffChange = { bg = p.diff_chg },
    DiffText = { bg = p.diff_txt },
    diffAdded = { fg = p.br_green },
    diffRemoved = { fg = p.br_red },
    diffChanged = { fg = p.br_yellow },
    diffFile = { fg = p.br_cyan },
    diffLine = { fg = p.br_black },
    diffIndexLine = { fg = p.br_black },

    -- ── legacy syntax ────────────────────────────────────────────────
    -- Red carries control flow, amber carries names, sage carries data.
    -- The cool slots are deliberately low-chroma so the file still reads
    -- red-dominant no matter how type-heavy the language is.
    Comment = { fg = p.br_black },
    Constant = { fg = p.br_magenta },
    String = { fg = p.br_green },
    Character = { fg = p.br_green },
    Number = { fg = p.br_magenta },
    Boolean = { fg = p.br_red },
    Float = { fg = p.br_magenta },
    Identifier = { fg = p.fg },
    Function = { fg = p.br_yellow },
    Statement = { fg = p.red },
    Conditional = { fg = p.red },
    Repeat = { fg = p.red },
    Label = { fg = p.red },
    Operator = { fg = p.punct },
    Keyword = { fg = p.red },
    Exception = { fg = p.br_red },
    PreProc = { fg = p.magenta },
    Include = { fg = p.red },
    Define = { fg = p.magenta },
    Macro = { fg = p.magenta },
    PreCondit = { fg = p.magenta },
    Type = { fg = p.br_cyan },
    StorageClass = { fg = p.red },
    Structure = { fg = p.br_cyan },
    Typedef = { fg = p.br_cyan },
    Special = { fg = p.br_yellow },
    SpecialChar = { fg = p.br_magenta },
    Tag = { fg = p.red },
    Delimiter = { fg = p.punct },
    SpecialComment = { fg = p.white },
    Debug = { fg = p.br_red },
    Underlined = { fg = p.br_blue, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = p.black },
    Error = { fg = p.br_red },
    Todo = { fg = p.bg, bg = p.br_yellow, bold = true },

    -- ── treesitter ───────────────────────────────────────────────────
    ['@variable'] = { fg = p.fg },
    ['@variable.builtin'] = { fg = p.br_red },
    ['@variable.parameter'] = { fg = p.white },
    ['@variable.member'] = { fg = p.br_blue },
    ['@constant'] = { fg = p.br_magenta },
    ['@constant.builtin'] = { fg = p.br_red },
    ['@constant.macro'] = { fg = p.magenta },
    ['@module'] = { fg = p.br_cyan },
    ['@label'] = { fg = p.red },
    ['@string'] = { fg = p.br_green },
    ['@string.documentation'] = { fg = p.green },
    ['@string.escape'] = { fg = p.br_magenta },
    ['@string.regexp'] = { fg = p.br_magenta },
    ['@string.special'] = { fg = p.br_magenta },
    ['@string.special.url'] = { fg = p.br_blue, underline = true },
    ['@character'] = { fg = p.br_green },
    ['@character.special'] = { fg = p.br_magenta },
    ['@boolean'] = { fg = p.br_red },
    ['@number'] = { fg = p.br_magenta },
    ['@number.float'] = { fg = p.br_magenta },
    ['@type'] = { fg = p.br_cyan },
    ['@type.builtin'] = { fg = p.cyan },
    ['@type.definition'] = { fg = p.br_cyan },
    ['@attribute'] = { fg = p.magenta },
    ['@property'] = { fg = p.br_blue },
    ['@function'] = { fg = p.br_yellow },
    ['@function.builtin'] = { fg = p.yellow },
    ['@function.call'] = { fg = p.br_yellow },
    ['@function.macro'] = { fg = p.magenta },
    ['@function.method'] = { fg = p.br_yellow },
    ['@function.method.call'] = { fg = p.br_yellow },
    ['@constructor'] = { fg = p.br_cyan },
    ['@operator'] = { fg = p.punct },
    ['@keyword'] = { fg = p.red },
    ['@keyword.function'] = { fg = p.red },
    ['@keyword.operator'] = { fg = p.red },
    ['@keyword.return'] = { fg = p.br_red },
    ['@keyword.exception'] = { fg = p.br_red },
    ['@keyword.conditional'] = { fg = p.red },
    ['@keyword.repeat'] = { fg = p.red },
    ['@keyword.import'] = { fg = p.red },
    ['@keyword.directive'] = { fg = p.magenta },
    ['@punctuation.delimiter'] = { fg = p.punct },
    ['@punctuation.bracket'] = { fg = p.punct },
    ['@punctuation.special'] = { fg = p.br_magenta },
    ['@comment'] = { fg = p.br_black },
    ['@comment.error'] = { fg = p.bg, bg = p.br_red, bold = true },
    ['@comment.warning'] = { fg = p.bg, bg = p.br_yellow, bold = true },
    ['@comment.todo'] = { fg = p.bg, bg = p.br_cyan, bold = true },
    ['@comment.note'] = { fg = p.bg, bg = p.br_green, bold = true },
    ['@tag'] = { fg = p.red },
    ['@tag.builtin'] = { fg = p.red },
    ['@tag.attribute'] = { fg = p.br_yellow },
    ['@tag.delimiter'] = { fg = p.punct },

    -- Markup: headings walk the red ramp outward so nesting depth is
    -- visible without reading the '#' count.
    ['@markup.heading.1'] = { fg = p.br_red, bold = true },
    ['@markup.heading.2'] = { fg = p.br_yellow, bold = true },
    ['@markup.heading.3'] = { fg = p.br_magenta, bold = true },
    ['@markup.heading.4'] = { fg = p.br_cyan, bold = true },
    ['@markup.heading.5'] = { fg = p.br_blue, bold = true },
    ['@markup.heading.6'] = { fg = p.br_green, bold = true },
    ['@markup.strong'] = { fg = p.br_white, bold = true },
    ['@markup.italic'] = { italic = true },
    ['@markup.strikethrough'] = { strikethrough = true },
    ['@markup.underline'] = { underline = true },
    ['@markup.raw'] = { fg = p.br_green },
    ['@markup.link'] = { fg = p.br_blue },
    ['@markup.link.url'] = { fg = p.br_blue, underline = true },
    ['@markup.link.label'] = { fg = p.br_cyan },
    ['@markup.list'] = { fg = p.br_red },
    ['@markup.list.checked'] = { fg = p.br_green },
    ['@markup.list.unchecked'] = { fg = p.br_black },
    ['@markup.quote'] = { fg = p.br_black, italic = true },
    ['@diff.plus'] = { fg = p.br_green },
    ['@diff.minus'] = { fg = p.br_red },
    ['@diff.delta'] = { fg = p.br_yellow },

    -- ── LSP semantic tokens ──────────────────────────────────────────
    ['@lsp.type.class'] = { link = '@type' },
    ['@lsp.type.decorator'] = { link = '@attribute' },
    ['@lsp.type.enum'] = { link = '@type' },
    ['@lsp.type.enumMember'] = { link = '@constant' },
    ['@lsp.type.function'] = { link = '@function' },
    ['@lsp.type.interface'] = { link = '@type' },
    ['@lsp.type.macro'] = { link = '@function.macro' },
    ['@lsp.type.method'] = { link = '@function.method' },
    ['@lsp.type.namespace'] = { link = '@module' },
    ['@lsp.type.parameter'] = { link = '@variable.parameter' },
    ['@lsp.type.property'] = { link = '@property' },
    ['@lsp.type.struct'] = { link = '@type' },
    ['@lsp.type.type'] = { link = '@type' },
    ['@lsp.type.typeParameter'] = { link = '@type.definition' },
    ['@lsp.type.variable'] = { link = '@variable' },
    ['@lsp.mod.readonly'] = { link = '@constant' },
    ['@lsp.mod.deprecated'] = { strikethrough = true },

    -- ── diagnostics ──────────────────────────────────────────────────
    DiagnosticError = { fg = p.br_red },
    DiagnosticWarn = { fg = p.br_yellow },
    DiagnosticInfo = { fg = p.br_blue },
    DiagnosticHint = { fg = p.br_cyan },
    DiagnosticOk = { fg = p.br_green },
    DiagnosticVirtualTextError = { fg = p.red },
    DiagnosticVirtualTextWarn = { fg = p.yellow },
    DiagnosticVirtualTextInfo = { fg = p.blue },
    DiagnosticVirtualTextHint = { fg = p.cyan },
    DiagnosticVirtualTextOk = { fg = p.green },
    DiagnosticUnderlineError = { sp = p.br_red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = p.br_yellow, undercurl = true },
    DiagnosticUnderlineInfo = { sp = p.br_blue, undercurl = true },
    DiagnosticUnderlineHint = { sp = p.br_cyan, undercurl = true },
    DiagnosticUnderlineOk = { sp = p.br_green, undercurl = true },
    DiagnosticDeprecated = { sp = p.br_black, strikethrough = true },
    DiagnosticUnnecessary = { fg = p.br_black },

    -- ── LSP ──────────────────────────────────────────────────────────
    LspReferenceText = { bg = p.sel_bg },
    LspReferenceRead = { bg = p.sel_bg },
    LspReferenceWrite = { bg = p.sel_bg, underline = true },
    LspSignatureActiveParameter = { fg = p.br_yellow, bold = true },
    LspInlayHint = { fg = p.dim, bg = 'NONE' },
    LspCodeLens = { fg = p.br_black },
    LspInfoBorder = { fg = p.divider },

    -- ── gitsigns ─────────────────────────────────────────────────────
    GitSignsAdd = { fg = p.green },
    GitSignsChange = { fg = p.yellow },
    GitSignsDelete = { fg = p.red },
    GitSignsAddNr = { fg = p.green },
    GitSignsChangeNr = { fg = p.yellow },
    GitSignsDeleteNr = { fg = p.red },
    GitSignsAddLn = { bg = p.diff_add },
    GitSignsChangeLn = { bg = p.diff_chg },
    GitSignsDeleteLn = { bg = p.diff_del },
    GitSignsCurrentLineBlame = { fg = p.dim },

    -- ── telescope ────────────────────────────────────────────────────
    TelescopeNormal = { fg = p.fg, bg = p.surface },
    TelescopeBorder = { fg = p.divider, bg = p.surface },
    TelescopeTitle = { fg = p.br_black },
    TelescopePromptNormal = { fg = p.fg, bg = p.overlay },
    TelescopePromptBorder = { fg = p.overlay, bg = p.overlay },
    TelescopePromptTitle = { fg = p.bg, bg = p.br_red, bold = true },
    TelescopePromptPrefix = { fg = p.br_red, bg = p.overlay },
    TelescopePromptCounter = { fg = p.br_black, bg = p.overlay },
    TelescopeResultsTitle = { fg = p.surface, bg = p.surface },
    TelescopePreviewTitle = { fg = p.bg, bg = p.br_green, bold = true },
    TelescopeSelection = { fg = p.br_white, bg = p.sel_bg },
    TelescopeSelectionCaret = { fg = p.br_red, bg = p.sel_bg },
    TelescopeMultiSelection = { fg = p.br_yellow },
    TelescopeMatching = { fg = p.br_red, bold = true },
    TelescopeResultsComment = { fg = p.br_black },

    -- ── blink.cmp ────────────────────────────────────────────────────
    BlinkCmpMenu = { fg = p.white, bg = p.surface },
    BlinkCmpMenuBorder = { fg = p.divider, bg = p.surface },
    BlinkCmpMenuSelection = { fg = p.br_white, bg = p.sel_bg, bold = true },
    BlinkCmpScrollBarThumb = { bg = p.black },
    BlinkCmpScrollBarGutter = { bg = p.surface },
    BlinkCmpLabel = { fg = p.white },
    BlinkCmpLabelDeprecated = { fg = p.br_black, strikethrough = true },
    BlinkCmpLabelMatch = { fg = p.br_red, bold = true },
    BlinkCmpLabelDetail = { fg = p.br_black },
    BlinkCmpLabelDescription = { fg = p.br_black },
    BlinkCmpKind = { fg = p.br_cyan },
    BlinkCmpSource = { fg = p.br_black },
    BlinkCmpDoc = { fg = p.fg, bg = p.surface },
    BlinkCmpDocBorder = { fg = p.divider, bg = p.surface },
    BlinkCmpDocSeparator = { fg = p.divider, bg = p.surface },
    BlinkCmpSignatureHelp = { fg = p.fg, bg = p.surface },
    BlinkCmpSignatureHelpBorder = { fg = p.divider, bg = p.surface },
    BlinkCmpSignatureHelpActiveParameter = { fg = p.br_yellow, bold = true },
    BlinkCmpGhostText = { fg = p.dim },

    -- ── neocodeium ───────────────────────────────────────────────────
    -- Same treatment as any ghost text: present, never mistakable for
    -- something you actually typed.
    NeoCodeiumSuggestion = { fg = p.dim },
    NeoCodeiumSingleLineLabel = { fg = p.bg, bg = p.br_yellow },
    NeoCodeiumSingleLineMore = { fg = p.br_black },
    NeoCodeiumLabel = { fg = p.bg, bg = p.br_red },

    -- ── which-key ────────────────────────────────────────────────────
    WhichKey = { fg = p.br_red },
    WhichKeyGroup = { fg = p.br_yellow },
    WhichKeyDesc = { fg = p.fg },
    WhichKeySeparator = { fg = p.dim },
    WhichKeyNormal = { bg = p.surface },
    WhichKeyBorder = { fg = p.divider, bg = p.surface },
    WhichKeyTitle = { fg = p.br_red, bg = p.surface },
    WhichKeyValue = { fg = p.br_black },

    -- ── neo-tree ─────────────────────────────────────────────────────
    NeoTreeNormal = { fg = p.white, bg = bg },
    NeoTreeNormalNC = { fg = p.white, bg = bg },
    NeoTreeWinSeparator = { fg = p.divider, bg = bg },
    NeoTreeEndOfBuffer = { fg = p.bg, bg = bg },
    NeoTreeRootName = { fg = p.br_red, bold = true },
    NeoTreeDirectoryName = { fg = p.br_yellow },
    NeoTreeDirectoryIcon = { fg = p.yellow },
    NeoTreeFileName = { fg = p.white },
    NeoTreeFileIcon = { fg = p.br_black },
    NeoTreeIndentMarker = { fg = p.black },
    NeoTreeExpander = { fg = p.br_black },
    NeoTreeSymbolicLinkTarget = { fg = p.br_cyan },
    NeoTreeDotfile = { fg = p.br_black },
    NeoTreeGitAdded = { fg = p.br_green },
    NeoTreeGitDeleted = { fg = p.br_red },
    NeoTreeGitModified = { fg = p.br_yellow },
    NeoTreeGitUntracked = { fg = p.br_magenta },
    NeoTreeGitIgnored = { fg = p.dim },
    NeoTreeGitConflict = { fg = p.br_red, bold = true },
    NeoTreeTitleBar = { fg = p.bg, bg = p.br_red },
    NeoTreeFloatBorder = { fg = p.divider, bg = p.surface },
    NeoTreeFloatTitle = { fg = p.br_red, bg = p.surface },

    -- ── mini.nvim ────────────────────────────────────────────────────
    -- The mode block is the only saturated element in the statusline, so
    -- mode is readable peripherally without reading the word.
    MiniStatuslineModeNormal = { fg = p.bg, bg = p.br_red, bold = true },
    MiniStatuslineModeInsert = { fg = p.bg, bg = p.br_green, bold = true },
    MiniStatuslineModeVisual = { fg = p.bg, bg = p.br_magenta, bold = true },
    MiniStatuslineModeReplace = { fg = p.bg, bg = p.br_yellow, bold = true },
    MiniStatuslineModeCommand = { fg = p.bg, bg = p.br_cyan, bold = true },
    MiniStatuslineModeOther = { fg = p.bg, bg = p.br_blue, bold = true },
    MiniStatuslineDevinfo = { fg = p.white, bg = p.overlay },
    MiniStatuslineFilename = { fg = p.br_black, bg = p.line },
    MiniStatuslineFileinfo = { fg = p.white, bg = p.overlay },
    MiniStatuslineInactive = { fg = p.br_black, bg = p.line },
    MiniIconsRed = { fg = p.br_red },
    MiniIconsOrange = { fg = p.br_yellow },
    MiniIconsYellow = { fg = p.yellow },
    MiniIconsGreen = { fg = p.br_green },
    MiniIconsCyan = { fg = p.br_cyan },
    MiniIconsBlue = { fg = p.br_blue },
    MiniIconsPurple = { fg = p.br_magenta },
    MiniIconsAzure = { fg = p.blue },
    MiniIconsGrey = { fg = p.br_black },

    -- ── todo-comments ────────────────────────────────────────────────
    TodoBgTODO = { fg = p.bg, bg = p.br_cyan, bold = true },
    TodoBgFIX = { fg = p.bg, bg = p.br_red, bold = true },
    TodoBgHACK = { fg = p.bg, bg = p.br_yellow, bold = true },
    TodoBgWARN = { fg = p.bg, bg = p.br_yellow, bold = true },
    TodoBgPERF = { fg = p.bg, bg = p.br_magenta, bold = true },
    TodoBgNOTE = { fg = p.bg, bg = p.br_green, bold = true },
    TodoBgTEST = { fg = p.bg, bg = p.br_blue, bold = true },
    TodoFgTODO = { fg = p.br_cyan },
    TodoFgFIX = { fg = p.br_red },
    TodoFgHACK = { fg = p.br_yellow },
    TodoFgWARN = { fg = p.br_yellow },
    TodoFgPERF = { fg = p.br_magenta },
    TodoFgNOTE = { fg = p.br_green },
    TodoFgTEST = { fg = p.br_blue },

    -- ── indent-blankline ─────────────────────────────────────────────
    IblIndent = { fg = p.black },
    IblScope = { fg = p.br_black },
    IblWhitespace = { fg = p.black },

    -- ── mason / lazy ─────────────────────────────────────────────────
    MasonHighlight = { fg = p.br_red },
    MasonHighlightBlock = { fg = p.bg, bg = p.br_red },
    MasonHighlightBlockBold = { fg = p.bg, bg = p.br_red, bold = true },
    MasonMuted = { fg = p.br_black },
    MasonMutedBlock = { fg = p.white, bg = p.overlay },
    LazyNormal = { fg = p.fg, bg = p.surface },
    LazyButton = { fg = p.white, bg = p.overlay },
    LazyButtonActive = { fg = p.bg, bg = p.br_red, bold = true },
    LazyH1 = { fg = p.bg, bg = p.br_red, bold = true },
    LazyH2 = { fg = p.br_red, bold = true },
    LazySpecial = { fg = p.br_cyan },
    LazyProgressDone = { fg = p.br_green },
    LazyProgressTodo = { fg = p.black },
  }

  vim.o.termguicolors = true
  vim.g.colors_name = 'ember'
  vim.o.background = 'dark'

  for group, spec in pairs(hl) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  -- :terminal reuses the same 16 slots, so a shell opened inside Neovim
  -- looks identical to the same shell in a Ghostty split.
  local ansi = {
    p.black,
    p.red,
    p.green,
    p.yellow,
    p.blue,
    p.magenta,
    p.cyan,
    p.white,
    p.br_black,
    p.br_red,
    p.br_green,
    p.br_yellow,
    p.br_blue,
    p.br_magenta,
    p.br_cyan,
    p.br_white,
  }
  for i, color in ipairs(ansi) do
    vim.g['terminal_color_' .. (i - 1)] = color
  end
end

return M
