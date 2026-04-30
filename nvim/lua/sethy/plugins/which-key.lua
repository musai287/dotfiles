return {
    -- Lo riabilitiamo con stile!
    "folke/which-key.nvim",
    enabled = true,
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        -- 500 millisecondi è perfetto: ti dà il tempo di digitare veloce senza
        -- che il menu appaia, ma se hai un vuoto di memoria e ti fermi, lui spunta.
        vim.o.timeoutlen = 500 
    end,
    opts = {
        preset = "modern", -- Prova "modern", "classic" o "helix"
        win = {
            border = "rounded",
            padding = { 1, 2 },
            zindex = 1000,
        },
        -- BATTEZZIAMO I GRUPPI:
        -- Sostituisci le lettere con quelle che usi davvero nel tuo setup
        spec = {
            { "<leader>f", group = "📁 File / Cerca" },
            { "<leader>g", group = "🐙 Git" },
            { "<leader>l", group = "🛠️ LSP / Codice" },
            { "<leader>x", group = "⚠️ Trouble / Diagnostica" },
            { "<leader>t", group = "🪟 Terminale" },
            { "<leader>b", group = "📦 Buffer" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
