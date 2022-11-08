local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end
    }
}

return packer.startup(function(use)
    -- Speed up neovim
    use 'lewis6991/impatient.nvim'
    -- Have packer manage itself
    use "wbthomason/packer.nvim"
    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/popup.nvim"
    -- Useful lua functions used ny lots of plugins
    use "nvim-lua/plenary.nvim"
    -- UI Component Library for Neovim
    use "MunifTanjim/nui.nvim"
    -- Better buffer close
    use "famiu/bufdelete.nvim"

    -- tokyonight
    use 'folke/tokyonight.nvim'
    -- icons dependencies
    use "kyazdani42/nvim-web-devicons"
    -- Lua line status bar
    use 'nvim-lualine/lualine.nvim'
    -- Bufferline
    use 'akinsho/bufferline.nvim'
    -- neotree
    use {"nvim-neo-tree/neo-tree.nvim", branch = "v2.x"}
    -- auto closing
    use "windwp/nvim-autopairs"
    -- auto save 
    use "Pocco81/auto-save.nvim"

    -- notifations

    -- settion manager

    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
