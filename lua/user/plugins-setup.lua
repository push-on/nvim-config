local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end
    }
}

-- Install your plugins here
return packer.startup(function(use)
    -- 📦 Main Plugins And dependencies 
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


    -- 🎨 Themes
    -- one Dark
    use 'navarasu/onedark.nvim'
    -- icons dependencies
    use "kyazdani42/nvim-web-devicons"
    -- Lua line status bar
    use 'nvim-lualine/lualine.nvim'
    -- Bufferline
    use 'akinsho/bufferline.nvim'
    -- neotree
    use {"nvim-neo-tree/neo-tree.nvim", branch = "v2.x"}

    -- 📌 cmp 
    -- completion plugin
    use "hrsh7th/nvim-cmp"
    -- buffer completions
    use "hrsh7th/cmp-buffer"
    -- path completions
    use "hrsh7th/cmp-path"
    -- cmdline completions
    use "hrsh7th/cmp-cmdline"
    -- snippet completions
    use "saadparwaiz1/cmp_luasnip"
    -- vs-code like icons for autocompletion
	  use("onsails/lspkind.nvim") 

    -- 📌 snippets
    -- snippet engine
    use "L3MON4D3/LuaSnip"
    -- a bunch of snippets to use
    use "rafamadriz/friendly-snippets"


    -- 📌 LSP
    use ("williamboman/mason.nvim")
    use ("williamboman/mason-lspconfig.nvim")
    use ("neovim/nvim-lspconfig")
    
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
