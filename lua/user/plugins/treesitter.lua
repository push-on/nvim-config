rainbow_active = 1
-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then return end

-- configure treesitter
treesitter.setup({
    -- enable syntax highlighting
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        custom_captures = {["punctuation.bracket"] = "", ["constructor"] = ""}
    },
    -- enable indentation
    indent = {enable = true},
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = {enable = true},
    -- ensure these language parsers are installed
    ensure_installed = {
        "json", "javascript", "typescript", "tsx", "yaml", "html", "css",
        "markdown", "svelte", "graphql", "bash", "lua", "vim", "dockerfile",
        "gitignore"
    },
    -- auto install above language parsers
    auto_install = true,
    rainbow = {
        enable = true,
        extended_mode = false,
        colors = {
            -- "#68a0b0",
            -- "#946EaD",
            -- "#c7aA6D",
            "Gold", "Orchid", "DodgerBlue"
            -- "Cornsilk",
            -- "Salmon",
            -- "LawnGreen",
        },
        disable = {"html"}
    }
})
