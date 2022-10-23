local status_ok, colorizer = pcall(require, "colorizer")
if status_ok then
    require'colorizer'.setup(
        {'css', 'javascript', 'jsx', html = {mode = 'background'}},
        {mode = 'foreground'})
end
