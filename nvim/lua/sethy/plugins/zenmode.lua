return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    window = {
      backdrop = 0.7, -- Oscura leggermente lo sfondo di Kitty
      width = 0.95,   -- Larghezza della finestra
      height = 0.95,  -- Altezza della finestra
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
        cursorline = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        laststatus = 0, -- Nasconde la lualine per un look pulitissimo
      },
    },
    -- Forza l'uso di una finestra fluttuante con bordo
    on_open = function(win)
      local config = vim.api.nvim_win_get_config(win)
      config.border = "rounded" -- Ecco il tuo bordo arrotondato!
      config.relative = "editor"
      vim.api.nvim_win_set_config(win, config)
      
      -- Applica il colore azzurro che abbiamo impostato in options.lua
      vim.api.nvim_set_hl(0, "ZenBorder", { fg = "#89b4fa" })
      vim.api.nvim_win_set_option(win, "winhl", "FloatBorder:ZenBorder")
    end,
  },
}
