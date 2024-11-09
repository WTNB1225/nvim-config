local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.startup(function(use)

    use({ "wbthomason/packer.nvim" })

    -- colorscheme
    use({ "EdenEast/nightfox.nvim" })

    -- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "glepnir/lspsaga.nvim" }) -- LSP UIs

    -- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "onsails/lspkind-nvim" })

    -- Formatter
	use({ "MunifTanjim/prettier.nvim" })

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use({ "nvim-telescope/telescope-file-browser.nvim" })

    -- Autotag
    use({ "windwp/nvim-ts-autotag" })

    -- Telescope
	use({ "nvim-telescope/telescope.nvim" })

    -- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine

	use 'jiangmiao/auto-pairs'

end)