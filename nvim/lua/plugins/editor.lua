return {
  {
    "0x00-ketsu/autosave.nvim",
    event = { "InsertLeave", "TextChanged" },
    config = function()
      require("autosave").setup({
        enable = true,
        prompt_style = "stdout", --<stdout|notify>
        prompt_message = function()
          return "Autosave: saved at " .. vim.fn.strftime("%H:%M:%S")
        end,
        events = { "InsertLeave", "TextChanged" },
        conditions = {
          exists = true,
          modifiable = true,
          filename_is_not = {},
          filetype_is_not = {},
        },
        write_all_buffers = false,
        debounce_delay = 100,
      })
    end,
  },

  -- File explore
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "ee",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
    },
    opts = {
      event_handlers = {
        event = "file_opened",
        handler = function(file_path)
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },

  -- search/replace in multiple files
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      {
        "sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },

  -- Search flash
  {
    "folke/flash.nvim",
    keys = { { "s", false } },
  },
}
