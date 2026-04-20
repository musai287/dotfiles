return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      end,
    })

    local signs = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = " ",
    }
    vim.diagnostic.config({
      signs = { text = signs },
      virtual_text = true,
      underline = true,
      update_in_insert = false,
    })

    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()
    local lsp_util = require("lspconfig.util")

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      },
      emmet_ls = {
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      },
      denols = {
        root_dir = lsp_util.root_pattern("deno.json", "deno.jsonc"),
      },
      ts_ls = {
        root_dir = function(fname)
          return not lsp_util.root_pattern("deno.json", "deno.jsonc")(fname)
            and lsp_util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
        end,
        single_file_support = false,
      },
    }

    for name, config in pairs(servers) do
      config.capabilities = capabilities
      vim.lsp.config(name, config)
      vim.lsp.enable(name)
    end
  end,
}
