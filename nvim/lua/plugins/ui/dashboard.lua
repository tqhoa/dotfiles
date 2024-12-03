return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
  ███╗   ███╗ █████╗      ██╗██╗███╗   ██╗██████╗ ██╗   ██╗
  ████╗ ████║██╔══██╗     ██║██║████╗  ██║██╔══██╗██║   ██║
  ██╔████╔██║███████║     ██║██║██╔██╗ ██║██████╔╝██║   ██║
  ██║╚██╔╝██║██╔══██║██   ██║██║██║╚██╗██║██╔══██╗██║   ██║
  ██║ ╚═╝ ██║██║  ██║╚█████╔╝██║██║ ╚████║██████╔╝╚██████╔╝
  ╚═╝     ╚═╝╚═╝  ╚═╝ ╚════╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝
  ]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        formats = {
          header = { "%s", align = "center" },
        },
      },
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        { pane = 1, section = "header" },
        --[[
        {
          pane = 2,
          section = "terminal",
          cmd = "colorscript -e rails",
          height = 8,
          padding = 1,
        },--]]
        { pane = 1, section = "keys", gap = 1, padding = 1 },

        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Recent Files",
          section = "recent_files",
          indent = 2,
          padding = 1,
          limit = 8,
        },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "hub status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
      },
    },
  },
}
