local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

-- import nvim-cmp plugin safely
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then return end
-- import luasnip plugin safely
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then return end

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        -- ["<ESC>"] = cmp.mapping.abort(), -- close completion window
        ["<TAB>"] = cmp.mapping.confirm({select = true}),
        ["<CR>"] = cmp.mapping.confirm({select = false})
    }),

    sources = {
        {name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"},
        {name = "path"}
    },
    formatting = {
        fields = {"kind", "abbr"},
        format = function(entry, vim_item)

            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]"
            })[entry.source.name]
            -- set max width
            local max_width = 30
            vim_item.abbr = string.sub(vim_item.abbr, 1, max_width)
            return vim_item
        end
    }
}
