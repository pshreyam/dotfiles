require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'navarasu/onedark.nvim'

  use 'neovim/nvim-lspconfig'

  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}

  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  use { 'Everblush/everblush.nvim', as='everblush' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "lukas-reineke/indent-blankline.nvim"
end)
