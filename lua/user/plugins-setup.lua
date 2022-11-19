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
      return require("packer.util").float { border = "rounded" }
    end
  }
}

return packer.startup(function(use)
  -- Speed up
  use "lewis6991/impatient.nvim"
  -- packer
  use "wbthomason/packer.nvim"
  -- Popup API
  use "nvim-lua/popup.nvim"
  -- plugins dependency
  use "nvim-lua/plenary.nvim"
  -- UI Component Library for Neovim
  use "MunifTanjim/nui.nvim"
  -- Better buffer close
  use "famiu/bufdelete.nvim"
  -- tokyonight
  use "folke/tokyonight.nvim"

  -- mason lspconfig
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- cmp
  use {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
  }


  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
