return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- c / c++
        "clangd",
        "clang-format",
        -- lua
        "lua-language-server",
        "stylua",
        -- python
        "basedpyright",
        "ruff",
        -- web (js / ts / html / css)
        "typescript-language-server",
        "eslint-lsp",
        "html-lsp",
        "css-lsp",
        "prettier",
      },
    },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "c",
        "cpp",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
      },
    },
  },
}
