return {
  -- tabs, which include filetype icons and close buttons.
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    opts = {
      options = {
        mode = "tabs",
        separator_style = "slant",
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = true,
        color_icons = true,
      },
      highlights = {
        separator = {
          fg = "#073642",
          bg = "#002b36",
        },
        separator_selected = {
          fg = "#073642",
        },
        background = {
          fg = "#657b83",
          bg = "#002b36",
        },
        buffer_selected = {
          fg = "#fdf6e3",
          bold = true,
        },
        fill = {
          bg = "#073642",
        },
      },
    },
  },

  -- Indent blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      return {
        enabled = false,
        indent = {
          char = "│",
          tab_char = "│",
          highlight = highlight,
        },
        scope = {
          show_start = true,
          show_end = true,
          enabled = false,
        },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
        },
      }
    end,
  },
}
