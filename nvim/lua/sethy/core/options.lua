-- vim.g.loaded_netrw = 0
-- vim.g.loaded_netrwPlugin = 0
-- vim.cmd("let g:netrw_liststyle = 3")
vim.cmd("let g:netrw_banner = 0 ")

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Enable folding ( setup in nvim-ufo )
vim.o.foldenable = true     -- Enable folding by default
vim.o.foldmethod = "manual" -- Default fold method (change as needed)
vim.o.foldlevel = 99        -- Open most folds by default
vim.o.foldcolumn = "0"

-- backspace
vim.opt.backspace = { "start", "eol", "indent" }

--split windows
vim.opt.splitright = true --split vertical window to the right
vim.opt.splitbelow = true --split horizontal window to the bottom

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- clipboard
vim.opt.clipboard:append("unnamedplus") --use system clipboard as default
vim.opt.hlsearch = true

-- for easy mouse resizing, just incase
vim.opt.mouse = "a"

-- gets rid of line with white spaces
vim.g.editorconfig = true

-- Migliora l'estetica dei bordi degli split in Neovim
vim.opt.fillchars = {
  vert = '│',
  horiz = '─',
  vertright = '├',
  vertleft = '┤',
  verthoriz = '┼',
}
-- ==========================================
-- FORZA I COLORI DEI BORDI FLUTTUANTI
-- ==========================================
-- Questo autocmd scatta ogni volta che carichi un tema e si assicura 
-- che i bordi non vengano mai resi invisibili dalla trasparenza.

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Colore del bordo (qui ho messo l'azzurro di Catppuccin/Tokyonight)
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89b4fa" })
    
    -- Se vuoi colorare anche il titolo del popup, decommenta qui sotto:
    -- vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#89b4fa", bold = true })
  end,
})
-- =========================================================================
-- AUTORUN ZENMODE (Con Dashboard Impaginata)
-- Lancia ZenMode ovunque, aspettando che i plugin finiscano di caricare
-- =========================================================================
vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("AutoZenMode", { clear = true }),
    callback = function()
        -- Aumentiamo il ritardo a 150ms. Snacks ha il tempo di creare la dashboard,
        -- e subito dopo ZenMode la "incornicia" senza crashare.
        vim.defer_fn(function()
            local ok, zen_view = pcall(require, "zen-mode.view")
            
            -- Se ZenMode è installato, non è già aperto, e la finestra è valida
            if ok and not zen_view.is_open() and vim.api.nvim_win_is_valid(0) then
                pcall(vim.cmd, "ZenMode")
            end
        end, 150)
    end,
})
