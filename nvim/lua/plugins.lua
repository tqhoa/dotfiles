local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

--vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Core UI
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'akinsho/nvim-bufferline.lua'


  -- Lsp stuff
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim' -- lspInstall
  use 'williamboman/mason-lspconfig.nvim'

  -- Completer 
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion 

  -- Tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Fortmat & editing
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'Pocco81/AutoSave.nvim'
  use 'terrortylor/nvim-comment'

  -- Navigation
  use 'kyazdani42/nvim-tree.lua'
  use{
    'nvim-telescope/telescope.nvim',
    requires = {
      'kdheepak/lazygit.nvim'
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Eye views
  use 'lewis6991/gitsigns.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'p00f/nvim-ts-rainbow'
  use 'glepnir/dashboard-nvim'
  use "lukas-reineke/indent-blankline.nvim"

  -- debug
  use 'rcarriga/nvim-notify'
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

end)
