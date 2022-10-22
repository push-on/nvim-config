local colorscheme = "onedark"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

require("onedark").setup({
        style = 'warmer',
        term_colors = true,
})