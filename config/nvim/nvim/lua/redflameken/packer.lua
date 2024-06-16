vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
    use 'rose-pine/neovim'
	use 'srcery-colors/srcery-vim'
    --[[
	use {
		'srcery-colors/srcery-vim',
		as = 'srcery',
		config = function()
			vim.cmd('colorscheme srcery')
		end
	}
    ]]--
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
    use "freed-wu/tmux-language-server"
    use "junegunn/goyo.vim"
    use "chrisbra/colorizer"
	use "nvim-lua/plenary.nvim"
    use "github/copilot.vim"
	use "mbbill/undotree"
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
            {'saadparwaiz1/cmp_luasnip'},
            {"rafamadriz/friendly-snippets"},
			{'L3MON4D3/LuaSnip'},
		}
	}
    use 'mfussenegger/nvim-jdtls'
    use 'mfussenegger/nvim-dap'
end)
