vim.cmd [[packadd packer.nvim]]

local function packerSync()
    vim.cmd("so");
    vim.cmd("PackerSync");
end

vim.keymap.set("n", "<leader>ps", packerSync)

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'nvim-telescope/telescope-ui-select.nvim'
    use 'ellisonleao/gruvbox.nvim'
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
    use "nvim-tree/nvim-tree.lua"
    use "stevearc/oil.nvim"
    use "chrisbra/colorizer"
	use "nvim-lua/plenary.nvim"
    -- use "github/copilot.vim"
	use "mbbill/undotree"
    use "nvim-tree/nvim-web-devicons"
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
			{'jay-babu/mason-nvim-dap.nvim'},
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lsp-signature-help'},
            {'saadparwaiz1/cmp_luasnip'},
            {"rafamadriz/friendly-snippets"},
            {"L3MON4D3/LuaSnip", run = "make install_jsregexp"},
		}
	}
    use 'mfussenegger/nvim-lint'
    use 'mfussenegger/nvim-jdtls'
    use 'mfussenegger/nvim-dap'
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    }
    use 'lervag/vimtex'
    use 'kmonad/kmonad-vim'
    use 'andweeb/presence.nvim'

    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    })
    use {
        "pmizio/typescript-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup {}
        end,
    }
    -- use 'typescript-language-server/typescript-language-server'

end)
