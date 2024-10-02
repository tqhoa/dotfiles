return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
    local debugpy_path = mason_path .. "packages/debugpy/venv/bin/python"

    require("dap-python").setup(debugpy_path)
  end,
}
