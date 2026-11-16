vim.cmd [[packadd packer.nvim]]

local function packerSync()
    vim.cmd("so");
    vim.cmd("PackerSync");
end

vim.keymap.set("n", "<leader>ps", packerSync)

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
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
    ]] --
    use {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        run = ':TSUpdate'
    }
    use {
        'redflameken/nvim-treesitter-context',
    }
    use "freed-wu/tmux-language-server"
    use "junegunn/goyo.vim"
    use "nvim-tree/nvim-tree.lua"
    use "stevearc/oil.nvim"
    use "chrisbra/colorizer"
    use "nvim-lua/plenary.nvim"
    -- use "github/copilot.vim"
    use "tpope/vim-fugitive"
    use "mbbill/undotree"
    use "nvim-tree/nvim-web-devicons"
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'jay-babu/mason-nvim-dap.nvim' }
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { "rafamadriz/friendly-snippets" }
    use { "L3MON4D3/LuaSnip", run = "make install_jsregexp" }
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
    use { 'redflameken/vim-android', branch = "master" }
    use 'dense-analysis/ale'
    use 'stevearc/conform.nvim'
    use {
        'chomosuke/typst-preview.nvim',
        tag = 'v1.*',
        config = function()
            require 'typst-preview'.setup {}
        end,
    }

    -- Now that I'm in my internship, where all of the employees are producing
    -- software that's mostly vibe-coded, I feel that this is the perfect time
    -- for me to try out vibe-coding. Sometimes, I feel that writing the code
    -- myself has me lagging behind. Watching my co-worker who finishes multiple
    -- issues within a day, while I'm only able to finish 1 to 3 with manual
    -- reviewing, writing, and occasionally asking opencode about how to
    -- implement something, or asking it to verify implementations. But I want
    -- to do in in the way that ThePrimeagen does it---with 99. I would like to
    -- vibe-code in a way where I define how I want the software to work, while
    -- the LLM writes the implementations
    use {
        'ThePrimeagen/99'
    }
end)
