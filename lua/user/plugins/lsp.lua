-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then return end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then return end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure html server
lspconfig["html"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    -- cmd = {"vscode-html-language-server"},
    filetypes = {"html"},
    init_options = {
        configurationSection = {"html", "css", "javascript"},
        embeddedLanguages = {css = true, javascript = true},
        provideFormatter = true
    }
})

-- configure css server
lspconfig["cssls"].setup({capabilities = capabilities, on_attach = on_attach})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {
        "html", "typescriptreact", "javascriptreact", "css", "sass", "scss",
        "less", "svelte"
    }
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
        Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {globals = {"vim"}},
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true
                }
            }
        }
    }
})
lspconfig["tsserver"]
    .setup({capabilities = capabilities, on_attach = on_attach})
lspconfig["jsonls"].setup({capabilities = capabilities, on_attach = on_attach})
lspconfig["pyright"].setup({capabilities = capabilities, on_attach = on_attach})
lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
