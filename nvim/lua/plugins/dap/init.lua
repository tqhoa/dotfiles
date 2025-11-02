-- Debugging Support

return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text", -- inline variable text while debugging
    "nvim-telescope/telescope-dap.nvim", -- telescope integration with dap
  },
  opts = {
    --[[
    controls = {
      element = "repl",
      enabled = false,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = "",
      },
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = "",
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = "",
    },
    layouts = {
      {
        elements = {
          {
            id = "scopes",
            size = 0.50,
          },
          {
            id = "stacks",
            size = 0.30,
          },
          {
            id = "watches",
            size = 0.10,
          },
          {
            id = "breakpoints",
            size = 0.10,
          },
        },
        size = 40,
        position = "left", -- Can be "left" or "right"
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 10,
        position = "bottom", -- Can be "bottom" or "top"
      },
    },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t",
    },
    render = {
      indent = 1,
      max_value_lines = 100,
    },
    --]]
  },
  keys = {
    { "<leader>d", "", desc = "+debug", mode = { "n", "v" } },
    {
      "<leader><F9>",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<F9>",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    {
      "<F10>",
      function()
        require("dap").step_info()
      end,
      desc = "Step Info",
    },
    {
      "<leader><F10>",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
  },
  config = function(_, opts)
    local dap = require("dap")
    local dap_ui = require("dapui")

    dap_ui.setup(opts)
    -- Config UI
    vim.fn.sign_define("DapBreakpoint", { text = "" })

    dap.listeners.after.event_initialized["dapui_config"] = function()
      require("dapui").open()
      dap_ui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      require("dapui").close()
      --dap_ui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      --dap_ui.close()
      require("dapui").close()
    end
  end,
}
