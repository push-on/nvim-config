local status_ok, nvim_tree = pcall(require, "neo-tree")
if status_ok then
    require("neo-tree").setup({
        -- popup_border_style = "rounded",
        enable_git_status = false,
        enable_diagnostics = false,
        default_component_configs = {
            container = {enable_character_fade = false},
            name = {use_git_status_colors = false}
        },
        window = {position = "left", width = 25},
        filesystem = {
            filtered_items = {
                visible = false, -- when true, they will just be displayed differently than normal items
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = false -- only works on Windows for hidden files/directories
            }
        }

    })
end
