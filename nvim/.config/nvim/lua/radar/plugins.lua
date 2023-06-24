local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
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
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used in lots of plugins
  use "kyazdani42/nvim-web-devicons"
  use { "akinsho/bufferline.nvim", tag = "*" }
  use "nvim-lualine/lualine.nvim"
  use "numToStr/Comment.nvim" -- Comments
  use "windwp/nvim-autopairs" -- Autopairs integrated with treesitter

  use "tpope/vim-fugitive" -- Git wrapper around vim
  use "TimUntersberger/neogit"

  -- Colorschemes
  use("gruvbox-community/gruvbox")
  use("folke/tokyonight.nvim")

  -- Toggleterm
  use "akinsho/toggleterm.nvim"

  -- Gitsigns
  use "lewis6991/gitsigns.nvim"

  -- Undotree
  use "mbbill/undotree"

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Completion
  use "hrsh7th/nvim-cmp" -- completion engine
  use "hrsh7th/cmp-buffer" -- buffer completion
  use "hrsh7th/cmp-path" -- path completion
  use "hrsh7th/cmp-cmdline" -- path completion
  use "saadparwaiz1/cmp_luasnip" -- snippet completion
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp"

  -- LSP
  use "neovim/nvim-lspconfig" -- native neovim LSP
  --[[ use "williamboman/nvim-lsp-installer" -- simple language server installer ]]
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- formatting and linting
  use "simrat39/rust-tools.nvim" -- extra rust tools

  -- Snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- prebuilt snippets to use

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'nvim-treesitter/nvim-treesitter-context'
  use "nvim-treesitter/playground"
  use "p00f/nvim-ts-rainbow"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  -- use "leoluz/nvim-dap-go"

  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Personal Wiki
  use "vimwiki/vimwiki"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
