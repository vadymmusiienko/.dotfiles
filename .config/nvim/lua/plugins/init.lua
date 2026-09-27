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
        -- williamboman/ transferred the repo to mason-org/; lazy.nvim keys specs
        -- by the repo name, so the old owner silently resolved to the same
        -- plugin, but name the current one.
        "mason-org/mason.nvim",
        -- NvChad lazy-loads mason on its :Mason* commands. Load it after startup
        -- as well so the ensure_installed check below actually gets to run.
        event = "VeryLazy",
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
        -- mason.nvim has no `ensure_installed` option of its own, and NvChad
        -- v2.5 dropped the :MasonInstallAll command that used to consume one,
        -- so the list above is inert unless something acts on it. Same shape as
        -- the treesitter spec below: install whatever is missing, once.
        config = function(_, opts)
            require("mason").setup(opts)

            local registry = require "mason-registry"
            local missing = vim.tbl_filter(function(pkg)
                local ok, installed = pcall(registry.is_installed, pkg)
                return ok and not installed
            end, opts.ensure_installed)

            if #missing > 0 then
                -- refresh() pulls the package index, so only pay for it when
                -- there is actually something to install.
                registry.refresh(function()
                    for _, pkg in ipairs(missing) do
                        local ok, handle = pcall(registry.get_package, pkg)
                        if ok then
                            handle:install()
                        end
                    end
                end)
            end
        end,
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
