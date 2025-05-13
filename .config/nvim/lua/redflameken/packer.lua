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
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {'jay-babu/mason-nvim-dap.nvim'}
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-nvim-lsp-signature-help'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {"rafamadriz/friendly-snippets"}
    use {"L3MON4D3/LuaSnip", run = "make install_jsregexp"}
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
    use 'andweeb/presence.nvim'
    use "michaelrommel/nvim-silicon"
    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        latex = { enabled = false }
    })
    use 'hsanson/vim-android'
    use 'dense-analysis/ale'

end)
