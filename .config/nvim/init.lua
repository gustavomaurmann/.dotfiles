require('mappings')
require('settings')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",


		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	{
	  "folke/zen-mode.nvim",
	  opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	  }
	},
	"navarasu/onedark.nvim",
	"ms-jpq/coq_nvim",
	"neovim/nvim-lspconfig",
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
})

require'lspconfig'.tsserver.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.csharp_ls.setup{}
vim.diagnostic.open_float(0, { scope = "line" })

require'lspconfig'.pyright.setup{}

-- theme
require('onedark').setup  {
	-- Main options --
	style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false,  -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = 'italic',
		keywords = 'none',
		functions = 'none',
		strings = 'none',
		variables = 'none'
	},

	-- Lualine options --
	lualine = {
		transparent = false, -- lualine center bar transparency
	},

	-- Custom Highlights --
	colors = {}, -- Override default colors
	highlights = {}, -- Override highlight groups

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true,   -- use undercurl instead of underline for diagnostics
		background = true,    -- use background color for virtual text
	},
}
require('onedark').load()

-- Zen Mode
vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 90,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = false
end)

-- Telescope
require("telescope").setup {
	pickers = {
		find_files = {
			theme = "cursor",
		},
		live_grep = {
			theme = "cursor",
		},
		buffers = {
			theme = "cursor",
		}
	},
	extensions = {
		file_browser = {
			theme = "cursor",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
}
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>fp', telescope.find_files, {})
vim.keymap.set('n', '<leader>ff', ":Telescope file_browser<CR>", { noremap = true})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})

-- Treesitter
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua", "javascript","c","python","cpp","c_sharp", "sql"},
	highlight = { enable = true },
	indent = { enable = true },
})

require('status')
