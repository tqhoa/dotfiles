return {
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
    keys = {
      { "<F6>", "<cmd>CompilerOpen<cr>", desc = "Open Compiler" },
      { "<F7>", "<cmd>CompilerRedo<cr>", desc = "Redo Compiler" },
      { "<F8>", "<cmd>CompilerStop<cr>", desc = "Stop Compiler" },
      -- Shift +  f6
      { "<F18>", "<cmd>CompilerToggleResults<cr>", desc = "Toggle compiler results" },
    },
  },
  {
    "stevearc/overseer.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 15,
        max_height = 15,
        default_detail = 1,
      },
    },
  },
}
