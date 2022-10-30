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
    -- highlight other uses of the word under the cursor
    use "RRethy/vim-illuminate"

    -- completion plugin
    use "hrsh7th/nvim-cmp"
    -- buffer completions
    use "hrsh7th/cmp-buffer"
    -- path completions
    use "hrsh7th/cmp-path"
    -- cmdline completions
    use "hrsh7th/cmp-cmdline"

    -- snippet engine
    use("L3MON4D3/LuaSnip")
    -- for autocompletion
    use("saadparwaiz1/cmp_luasnip")
    -- useful snippets
    use("rafamadriz/friendly-snippets")

    -- in charge of managing lsp servers, linters & formatters
    use("williamboman/mason.nvim")
    -- bridges gap b/w mason & lspconfig
    use("williamboman/mason-lspconfig.nvim")

    -- configuring lsp servers
    use("neovim/nvim-lspconfig")
    -- for autocompletion
    use("hrsh7th/cmp-nvim-lsp")

    -- formatting & linting
    use("jose-elias-alvarez/null-ls.nvim")
    -- bridges gap b/w mason & null-ls
    use("jayp0521/mason-null-ls.nvim")

    -- treesitter configuration
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({with_sync = true})
        end
    })

    -- auto closing
    use("windwp/nvim-autopairs")
    -- autoclose tags
    use({"windwp/nvim-ts-autotag", after = "nvim-treesitter"})

    -- auto save 
    use "Pocco81/auto-save.nvim"

    -- notifations

    -- settion manager

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
