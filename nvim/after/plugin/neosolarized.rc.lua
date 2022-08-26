local status, n = pcall(require, "neosolarized")
if (not status) then return end

n.setup({
  comment_italics = true,
})

local cb = require('colorbuddy.init')
local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local groups = cb.groups
local styles = cb.styles

Color.new('black', '#99cc99')
Color.new('red', '#00ba7c')

-- todo change 
--Color.new('white',     '#f2e5bc')
--Color.new('red',       '#cc6666')
--Color.new('pink',      '#fef601')
--Color.new('green',     '#99cc99')
--Color.new('yellow',    '#f8fe7a')
--Color.new('blue',      '#81a2be')
--Color.new('aqua',      '#8ec07c')
---Color.new('cyan',     '#8abeb7')
--Color.new('purple',    '#8e6fbd')
--Color.new('violet',    '#b294bb')
--Color.new('orange',    '#de935f')
--Color.new('brown',     '#a3685a')
--Color.new('seagreen',  '#698b69')
--Color.new('turquoise', '#698b69')

Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

