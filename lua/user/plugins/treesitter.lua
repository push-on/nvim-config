-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then return end

-- configure treesitter
treesitter.setup({
    -- enable syntax highlighting
    highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
        disable = {"yaml", "html"},
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat,
                                    vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end
    },
    -- enable indentation
    indent = {enable = true},
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = {enable = true},
    -- ensure these language parsers are installed
    ensure_installed = {
        "json", "javascript", "typescript", "tsx", "css", "lua", "vim",
        "gitignore", "rust", "help", "c", "cpp", "python"
    },
    ignore_install = {"yaml", "html"},
    rainbow = {
        enable = false,
        disable = {"html"},
        extended_mode = false,
        max_file_lines = nil
    },
    -- auto install above language parsers
    auto_install = false
})
