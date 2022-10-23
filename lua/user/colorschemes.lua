local colorscheme = "onedark"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if status_ok then
    require("onedark").setup({style = 'warmer', term_colors = true})
end
