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

-- clangd needs a compile database (compile_commands.json / compile_flags.txt /
-- .clangd) at the project root, otherwise it guesses the compiler flags and
-- reports bogus "file not found" / "undeclared identifier" errors.
vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index", -- index the whole project, not just open files
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=never", -- don't auto-add #includes on completion
        "--offset-encoding=utf-16", -- avoids the multi-encoding warning
    },
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
