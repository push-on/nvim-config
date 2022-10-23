-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then return end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then return end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = {Error = " ", Warn = " ", Hint = "ﴞ ", Info = " "}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

-- configure html server
lspconfig["html"].setup({capabilities = capabilities, on_attach = on_attach})

-- configure css server
lspconfig["cssls"].setup({capabilities = capabilities, on_attach = on_attach})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})


-- configure lua server 
lspconfig["sumneko_lua"].setup({
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

-- configure TypeScript server 
lspconfig["tsserver"]
    .setup({capabilities = capabilities, on_attach = on_attach})

-- configure Rust server 
lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- configure C server 
lspconfig["clangd"].setup({capabilities = capabilities, on_attach = on_attach})

-- configure emmet server 
lspconfig["emmet_ls"]
    .setup({capabilities = capabilities, on_attach = on_attach})
-- configure Json server 

lspconfig["jsonls"].setup({capabilities = capabilities, on_attach = on_attach})

-- configure Powershell server 
lspconfig["powershell_es"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- configure pyright server 
lspconfig["pyright"].setup({capabilities = capabilities, on_attach = on_attach})

-- configure Lemx server 
lspconfig["lemminx"].setup({capabilities = capabilities, on_attach = on_attach})

-- configure Yaml server 
lspconfig["yamlls"].setup({capabilities = capabilities, on_attach = on_attach})

-- configure Bash server 
lspconfig["bashls"].setup({capabilities = capabilities, on_attach = on_attach})

-- configure Js server 
lspconfig["quick_lint_js"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
