local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

configs.setup({
    auto_install = true,
    ensure_installed = {
        "json", "javascript", "typescript", "jsx", "tsx", "html", "css", "lua",
        "vim", "rust", "python"
    },
    autopairs = {enable = true},
    indent = {enable = true, disable = {"python", "css"}}
})
