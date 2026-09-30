return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    require("lazy").load({ plugins = { "markdown-preview.nvim" } })
    vim.fn["mkdp#util#install"]()
  end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    -- Sostituisci con 'chrome', 'brave', 'safari' o il tuo browser predefinito
    vim.g.mkdp_browser = 'firefox' 
  end,
}
