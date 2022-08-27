local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },

  indent = {
    enable = true,
    disable = {},
  },

  ensure_installed = {
    "tsx",
    "fish",
    "php",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "typescript",
    "vue",
    "python"
  },

  autotag = {
    enable = true,
  },

  rainbow = {
    enable = true,
    disable = {},
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {"#c1bf89", "#87c095", "#82abbc", "#d39bb6", "#acb765"} -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },

  matchup = {
    enable = true
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
