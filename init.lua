local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end
require "user.plugins-setup"
require "user.core.options"
require "user.core.colorscheme"
require "user.plugins.treesitter"
require "user.plugins.nvim-tree"
require "user.plugins.bufferline"
require "user.plugins.lualine"
require "user.plugins.lsp"
require "user.plugins.cmp"
require "user.plugins.autopairs"
require "user.core.keymaps"
