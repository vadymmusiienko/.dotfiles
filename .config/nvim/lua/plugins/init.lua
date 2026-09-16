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
                "luadoc",
                "printf",
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
                -- Highlights TODO:/NOTE:/FIXME: etc. inside comments of every
                -- language whose queries inject the "comment" parser.
                "comment",
                -- Doxygen blocks (/// and /** */) in C/C++.
                "doxygen",
            },
        },
        -- `ensure_installed` is a NvChad convention consumed by :TSInstallAll;
        -- nvim-treesitter's `main` branch has no auto-install of its own, so
        -- parsers added to the list above would otherwise stay uninstalled
        -- until :TSInstallAll is run by hand.
        config = function(_, opts)
            local installed = require("nvim-treesitter.config").get_installed "parsers"
            local missing = vim.tbl_filter(function(lang)
                return not vim.tbl_contains(installed, lang)
            end, opts.ensure_installed)

            if #missing > 0 then
                require("nvim-treesitter").install(missing)
            end
        end,
    },
}
