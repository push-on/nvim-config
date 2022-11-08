-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if status then
    run = function()
        require("nvim-treesitter.install").update({with_sync = true})
    end
    -- configure treesitter
    treesitter.setup({
        -- enable syntax highlighting
        highlight = {enable = true},
        -- enable indentation
        indent = {enable = true},
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {enable = true},
        -- ensure these language parsers are installed
        ensure_installed = {
            "json", "javascript", "typescript", "tsx", "yaml", "html", "css",
            "lua", "vim", "gitignore", "rust"
        },
        -- auto install above language parsers
        auto_install = true
    })

end
