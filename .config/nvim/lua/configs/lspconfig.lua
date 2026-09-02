require("nvchad.configs.lspconfig").defaults()

-- lua_ls is enabled by nvchad defaults above
local servers = { "html", "cssls", "clangd", "ruff", "basedpyright", "ts_ls", "eslint" }

-- basedpyright does type checking & completions, ruff owns linting/imports/formatting
vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      analysis = { typeCheckingMode = "standard" },
    },
  },
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
