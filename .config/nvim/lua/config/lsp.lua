-- Enable the LSP servers which are required
vim.lsp.enable({
  "luals",
  "pyright",
  "rust_analyzer",
  "gopls",
})

-- Configure diagnostics
vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
})
