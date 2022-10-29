local status_ok, _ = pcall(require, "lualine")
if status_ok then
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'tokyonight',
            component_separators = {left = '', right = ''},
            section_separators = {left = '', right = ''},
            disabled_filetypes = {statusline = {}, winbar = {}},
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = true,
            refresh = {statusline = 1000, tabline = 1000, winbar = 1000}
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {"require'lsp-status'.status()"},
            lualine_x = {'filetype'}
            -- lualine_y = {''},
            -- lualine_z = {''}
            -- lualine_x = {'encoding', 'fileformat', 'filetype'},
            -- lualine_y = {'progress'},
            -- lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {'progress'},
            lualine_z = {}
        }
    }
end
