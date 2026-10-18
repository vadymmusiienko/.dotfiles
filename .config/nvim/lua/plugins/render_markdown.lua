-- Renders markdown in the buffer itself: headings, checkboxes, code blocks,
-- tables, etc. The line under the cursor shows the raw markdown for editing.
return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    keys = {
        {
            "<leader>md",
            function()
                require("render-markdown").toggle()
            end,
            ft = "markdown",
            desc = "markdown toggle render",
        },
    },
    opts = {
        -- LaTeX math needs the latex parser plus utftex/latex2text installed
        latex = { enabled = false },
    },
}
