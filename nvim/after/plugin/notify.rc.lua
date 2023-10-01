local status, ntfy = pcall(require, "notify")
if not (status) then return end

ntfy.setup({
  background_colour ="#fefefe",
  timeout= 2000
})
