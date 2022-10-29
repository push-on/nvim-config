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

    -- essential plugins
    use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
    use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
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

    -- autocompletion
    -- completion plugin
    use "hrsh7th/nvim-cmp"
    -- buffer completions
    use "hrsh7th/cmp-buffer"
    -- path completions
    use "hrsh7th/cmp-path"
    -- cmdline completions
    use "hrsh7th/cmp-cmdline"

    -- snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets

    -- managing & installing lsp servers, linters & formatters
    use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
    use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

    -- configuring lsp servers
    use("neovim/nvim-lspconfig") -- easily configure language servers
    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    use({"glepnir/lspsaga.nvim", branch = "main"}) -- enhanced lsp uis

    -- formatting & linting
    use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
    use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

    -- treesitter configuration
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({with_sync = true})
        end
    })

    -- auto closing
    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
    use({"windwp/nvim-ts-autotag", after = "nvim-treesitter"}) -- autoclose tags

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
