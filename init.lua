local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end
require "user.plugins-setup"
require "user.core.options"
require "user.core.keymaps"
require "user.core.colorscheme"
require "user.plugins.nvim-tree"
require "user.plugins.lualine"
require "user.plugins.autopairs"
require "user.plugins.bufferline"
require "user.plugins.treesitter"
require "user.plugins.cmp"
require "user.plugins.lsp"
