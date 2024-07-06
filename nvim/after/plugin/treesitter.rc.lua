local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

vim.cmd("highlight default TSRainbow01  guifg=#d39bb6 ctermfg=Red")
vim.cmd("highlight default TSRainbow02  guifg=#c1bf89 ctermfg=White")
vim.cmd("highlight default TSRainbow03  guifg=#87c095 ctermfg=Blue")
vim.cmd("highlight default TSRainbow04  guifg=#82abbc ctermfg=Green")
vim.cmd("highlight default TSRainbow05  guifg=#acb765 ctermfg=Cyan")

ts.setup({
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},

	modules = {},
	modulessync_install = false,
	auto_install = false,
	sync_install = false,
	ignore_install = {},

	indent = {
		enable = true,
		disable = {},
	},

	ensure_installed = {
		"fish",
		"php",
		"json",
		"yaml",
		"css",
		"html",
		"lua",
		"typescript",
		"vue",
		"python",
	},

	--autotag = {
	--  enable = true,
	--},

	rainbow = {
		enable = true,
		disable = {},
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		--[[ 
    hlgroups = {
			'TSRainbowCyan',
      'TSRainbow01',
      'TSRainbow02',
      'TSRainbow03',
      'TSRainbow04',
      'TSRainbow05',
      'TSRainbowRed',
			'TSRainbowYellow',
			'TSRainbowBlue',
			'TSRainbowOrange',
			'TSRainbowGreen',
			'TSRainbowViolet',
    }
  ]]
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
