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

    formatters = {
        prettier = {
            prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
        },

        stylua = {
            prepend_args = {
                "--indent-type",
                "Spaces",
                "--indent-width",
                "4",
            },
        },

        ["clang-format"] = {
            prepend_args = {
                "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
            },
        },
    },

    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return options
