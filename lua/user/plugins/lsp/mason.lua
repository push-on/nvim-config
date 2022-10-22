local mason_status, mason = pcall(require, "mason")
local mason_lspconfig_status, mason_lspconfig =
    pcall(require, "mason-lspconfig")

if mason_status then
    mason_lspconfig.setup({
        ensure_installed = {
            "tsserver", "html", "cssls", "tailwindcss", "sumneko_lua",
            "rust_analyzer", "clangd", "emmet_ls", "jsonls", "powershell_es",
            "pyright", "lemminx", "yamlls", "bashls", "quick_lint_js"
        },
        automatic_installation = true
    })
end

