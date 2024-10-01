return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
      enabled = true,
      execution_message = {
        enabled = true,
        message = function() -- message to print on save
          return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 2.1, -- dim the color of `message`
        cleaning_interval = 100, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
      },
      conditions = {
        exists = true,
        modifiable = true,
      },
      write_all_buffers = false,
      on_off_commands = true,
      clean_command_line_interval = 0,
      debounce_delay = 100,
      debug = false,
    },
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
          require("neo-tree").close_all()
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
}
