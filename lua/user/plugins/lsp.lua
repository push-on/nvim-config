-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then return end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then return end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
    -- diagnostics.flake8
	},
})

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = {Error = " ", Warn = " ", Hint = "ﴞ ", Info = " "}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

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
lspconfig["tsserver"]
    .setup({capabilities = capabilities, on_attach = on_attach})
lspconfig["jsonls"].setup({capabilities = capabilities, on_attach = on_attach})
lspconfig["pyright"].setup({capabilities = capabilities, on_attach = on_attach})
lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
