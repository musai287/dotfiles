return {
	"ajbucci/ipynb.nvim",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"neovim/nvim-lspconfig",
		"nvim-tree/nvim-web-devicons",
		"folke/snacks.nvim",
	},
	config = function()
		require("lazy").load({ plugins = { "nvim-treesitter" } })

		local plugin_path = vim.fn.stdpath("data") .. "/lazy/ipynb.nvim"
		local grammar_path = plugin_path .. "/tree-sitter-ipynb"

		-- 1. Aggiunge le query (highlights/injections) di tree-sitter-ipynb al runtimepath
		vim.opt.rtp:append(grammar_path)

		-- 2. Registra il parser per nvim-treesitter (branch master)
		local ok, parsers = pcall(require, "nvim-treesitter.parsers")
		if ok and parsers.get_parser_configs then
			local parser_config = parsers.get_parser_configs()
			parser_config.ipynb = {
				install_info = {
					url = grammar_path,
					files = { "src/parser.c", "src/scanner.c" },
					generate_requires_npm = false,
					requires_generate_from_grammar = false,
				},
				filetype = "ipynb",
			}
		end

		local python_path = nil
		local mac_ml_py = "/opt/homebrew/Caskroom/miniconda/base/envs/ml2627/bin/python"

		if vim.env.CONDA_PREFIX then
			python_path = vim.env.CONDA_PREFIX .. "/bin/python"
		elseif vim.fn.executable(mac_ml_py) == 1 then
			python_path = mac_ml_py
		end

		require("ipynb").setup({
			kernel = {
				python_path = python_path,
			},
			shadow = {
				location = "workspace",
			},
		})
	end,
}
