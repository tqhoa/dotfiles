return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      code_action_prompt = {
        enable = false,
        sign = false,
        sign_priority = 20,
        virtual_text = false,
      },
      ui = {
        code_action = "💡",
        winblend = 100,
        border = "rounded",
      },
      symbol_in_winbar = {
        enable = true,
        color_mode = true,
      },
    })
  end,
}
