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
      },
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        { pane = 1, icon = "󰘳 ", title = "Keys", section = "keys", indent = 3, gap = 0, padding = 1 },
        {
          pane = 1,
          icon = " ",
          title = "Recent Files",
          section = "recent_files",
          indent = 3,
          padding = 1,
          limit = 12,
        },
        --[[
        {
          pane = 1,
          section = "terminal",
          cmd = "colorscript -e square",
          height = 5,
          padding = 1,
        },--]]
        {
          pane = 1,
          icon = " ",
          title = "Projects",
          section = "projects",
          indent = 3,
          padding = 1,
        },
        { pane = 1, section = "header", padding = 2 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "hub status --short --branch --renames",
          height = 7,
          width = 100,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        {
          pane = 2,
          title = "Git Logs",
          cmd = "hub log -12 --graph --oneline --decorate --pretty='%h on %ad by %cn commited %s' --date='short' --shortstat",
          icon = " ",
          height = 26,
          width = 100,
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          padding = 1,
          indent = 0,
          ttl = 5 * 60,
        },
      },
    },
  },
}
