local config = require("lazyvim.config")
return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    local config_colorizer = require("colorizer")
    config_colorizer.setup({ "*" })
  end,
}
