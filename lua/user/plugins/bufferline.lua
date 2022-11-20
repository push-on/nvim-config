local status_ok, _ = pcall(require, "bufferline")
if status_ok then
    require("bufferline").setup {
        options = {
            offsets = {
                {filetype = "NvimTree", text = "", padding = 1},
                {filetype = "neo-tree", text = "", padding = 1},
                {filetype = "Outline", text = "", padding = 1}
            },
            buffer_close_icon = "",
            modified_icon = "",
            close_icon = "",
            show_close_icon = false,
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 20,
            max_prefix_length = 13,
            tab_size = 22,
            show_tab_indicators = true,
            enforce_regular_tabs = false,
            view = "multiwindow",
            show_buffer_close_icons = false,
            separator_style = "thin",
            always_show_bufferline = true,
            diagnostics = false
        }
    }
end
