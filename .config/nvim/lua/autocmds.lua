require "nvchad.autocmds"

-- clangd reports the branches of #if/#ifdef/#ifndef that are not being compiled
-- as semantic tokens of type "comment", which Neovim highlights with
-- @lsp.type.comment.{c,cpp} -> @comment. Because LSP semantic tokens outrank
-- treesitter, the whole inactive branch renders in the comment colour and looks
-- like it was commented out.
--
-- Neovim composes highlight attributes across priority layers, but `fg`
-- replaces rather than blends, so no single highlight group can say "same hue,
-- a bit dimmer". Instead: silence the LSP group, then repaint the inactive
-- range with dimmed mirrors of whatever treesitter groups apply underneath.
-- Only the glyphs change, the background is left alone.
--
-- clangd only ever uses the "comment" token type for inactive code (real
-- comments get no semantic token at all), so the type alone identifies a
-- region, and clangd is currently the only server this needs to cover.
--
-- To flip which branch is the live one, define the macro for clangd instead,
-- e.g. `CompileFlags: { Add: [-DINSTRUMENT_MEMORY] }` in the project's .clangd.

-- How far each colour is pulled toward the background. 0 keeps the original
-- colour, 1 makes the text invisible.
local DIM = 0.40

local ns = vim.api.nvim_create_namespace "inactive_preproc_dim"

-- Mix `amount` of `to` into `from`; both are 24-bit RGB ints.
local function blend(from, to, amount)
    local out = 0
    for _, shift in ipairs { 16, 8, 0 } do
        local a = bit.band(bit.rshift(from, shift), 0xFF)
        local b = bit.band(bit.rshift(to, shift), 0xFF)
        out = out + bit.lshift(math.floor(a + (b - a) * amount + 0.5), shift)
    end
    return out
end

-- Dimmed counterpart per treesitter group, rebuilt whenever the theme changes.
local mirrors = {}

-- Returns the name of a dimmed clone of `group`, or nil when the group carries
-- no foreground of its own (@spell, @_parent and friends), which is what lets
-- the caller fall back to the next capture down.
local function mirror_of(group)
    local cached = mirrors[group]
    if cached ~= nil then
        return cached or nil
    end

    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
    local name = false

    if hl.fg and normal.bg then
        name = "InactivePreproc_" .. group:gsub("[^%w]", "_")
        hl.fg = blend(hl.fg, normal.bg, DIM)
        hl.bg = nil -- dim the letters only, never tint the line
        vim.api.nvim_set_hl(0, name, hl)
    end

    mirrors[group] = name
    return name or nil
end

-- Collect the dimmed spans for one line of an inactive region by running the
-- treesitter highlights query over just that row, for the main tree and any
-- injected ones. Iteration order is the highlighter's own conflict resolution:
-- later captures win, so later spans get the higher extmark priority.
local function dim_spans(buf, row, start_col, end_col)
    local ok, parser = pcall(vim.treesitter.get_parser, buf)
    if not ok or not parser then
        return {}
    end

    local spans = {}

    parser:for_each_tree(function(tree, ltree)
        local lang = ltree:lang()
        local query = vim.treesitter.query.get(lang, "highlights")
        if not query then
            return
        end

        local root = tree:root()
        local root_start, _, root_end = root:range()
        if row < root_start or row > root_end then
            return
        end

        for id, node in query:iter_captures(root, buf, row, row + 1) do
            -- A capture may be nil-coloured (@spell, @_parent); mirror_of says so and
            -- the span is simply dropped, letting the capture below it show.
            local group = mirror_of("@" .. query.captures[id] .. "." .. lang)
            if group then
                local node_start_row, node_start_col, node_end_row, node_end_col = node:range()
                local from = node_start_row == row and node_start_col or start_col
                local to = node_end_row == row and node_end_col or end_col
                from, to = math.max(from, start_col), math.min(to, end_col)
                if from < to then
                    spans[#spans + 1] = { from, to, group }
                end
            end
        end
    end)

    return spans
end

-- Repaint one line of an inactive region with dimmed colours.
local function dim_range(buf, row, start_col, end_col)
    for i, span in ipairs(dim_spans(buf, row, start_col, end_col)) do
        vim.api.nvim_buf_set_extmark(buf, ns, row, span[1], {
            end_col = span[2],
            hl_group = span[3],
            -- above the LSP semantic token layer (125), which is itself above
            -- treesitter (100); the offset preserves the query's own ordering
            priority = 200 + i,
        })
    end
end

local function silence_lsp_comment()
    for _, ft in ipairs { "c", "cpp" } do
        vim.api.nvim_set_hl(0, "@lsp.type.comment." .. ft, {})
    end
end

silence_lsp_comment()

vim.api.nvim_create_autocmd("LspTokenUpdate", {
    desc = "Dim inactive #ifdef branches without flattening their syntax colours",
    callback = function(args)
        local buf = args.buf
        if vim.bo[buf].filetype ~= "c" and vim.bo[buf].filetype ~= "cpp" then
            return
        end

        local token = args.data.token

        -- Clear unconditionally: when a branch becomes live, clangd re-tokenises
        -- those lines as ordinary code and this is what drops the stale dimming.
        vim.api.nvim_buf_clear_namespace(buf, ns, token.line, token.line + 1)

        if token.type == "comment" then
            dim_range(buf, token.line, token.start_col, token.end_col)
        end
    end,
})

-- base46 and any :colorscheme call reset highlight groups, so drop the cached
-- mirrors and ask the servers to resend tokens so the lines get repainted.
vim.api.nvim_create_autocmd("ColorScheme", {
    desc = "Rebuild inactive-branch dim colours for the new theme",
    callback = function()
        mirrors = {}
        silence_lsp_comment()

        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) then
                vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
                if next(vim.lsp.get_clients { bufnr = buf, name = "clangd" }) then
                    pcall(vim.lsp.semantic_tokens.force_refresh, buf)
                end
            end
        end
    end,
})
