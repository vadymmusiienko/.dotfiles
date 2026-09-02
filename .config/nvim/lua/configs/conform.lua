local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "ruff_organize_imports", "ruff_format" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
