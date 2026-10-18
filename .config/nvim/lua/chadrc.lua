-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "catppuccin",

    -- Colors for the custom comment tags in after/queries/comment/highlights.scm.
    -- Example: @comment.error (FIXME/BUG/ERROR)
    hl_add = {
        ["@comment.debug"] = { fg = "black", bg = "purple" },
        ["@comment.error"] = { fg = "black", bg = "red" },
    },

    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
