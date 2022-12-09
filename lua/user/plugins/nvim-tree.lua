local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then return end

neotree.setup {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = false,
    enable_diagnostics = false,
    default_component_configs = {
        name = {trailing_slash = false, use_git_status_colors = true}
    },
    filesystem = {
        filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false, -- only works on Windows for hidden files/directories
            never_show = {"desktop.ini"}
        }
    },
    window = {
        position = "left",
        width = 35,
        mappings = {["p"] = {"toggle_preview", config = {use_float = false}}}
    }

}
