# Neovim

My Neovim config, built on [NvChad](https://github.com/NvChad/NvChad) v2.5.
NvChad is loaded as a plugin, so this directory only holds my overrides on top
of it.

## Setup

- `brew install neovim` (included in the Brewfile)
- Launch `nvim` once. lazy.nvim bootstraps itself, installs the plugins, and
  Mason and Treesitter install the tools and parsers listed below.
- Requires a Nerd Font in the terminal, and `git` on PATH.

## Layout

```
init.lua                  Bootstrap lazy.nvim, load NvChad, then my files
lua/chadrc.lua            NvChad UI settings (theme)
lua/options.lua           Editor options
lua/mappings.lua          Key mappings
lua/autocmds.lua          Dim inactive C/C++ preprocessor branches
lua/plugins/init.lua      Plugin specs: conform, lspconfig, mason, treesitter
lua/plugins/vim_tmux_nav.lua
lua/configs/lazy.lua      lazy.nvim options
lua/configs/lspconfig.lua Language server setup
lua/configs/conform.lua   Formatters and format-on-save
```

## What I changed

- **Theme**: Catppuccin, set in `chadrc.lua`.
- **Indentation**: 4 spaces everywhere, expandtab, plus relative line numbers.
  The formatters below are configured to match, so nothing reformats to 2.
- **Mappings**: `;` enters command mode, `jk` leaves insert mode, and
  `Ctrl-h/j/k/l` move between splits and tmux panes through
  [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator).
- **Language servers** (`configs/lspconfig.lua`): clangd, basedpyright, ruff,
  ts_ls, eslint, html, cssls, and lua_ls from the NvChad defaults. clangd runs
  with `--background-index`, `--clang-tidy`, and `--log=error`, the last because
  its progress chatter otherwise grows `lsp.log` without bound. Python splits the
  work: basedpyright for types and completion, ruff for linting, imports, and
  formatting.
- **Formatters** (`configs/conform.lua`): format on save with a 500 ms timeout.
  stylua for Lua, prettier for web and markdown, clang-format for C and C++,
  ruff for Python, all pinned to 4-space indentation.
- **Tooling install**: both the Mason and Treesitter specs install anything
  missing from their `ensure_installed` lists on startup. NvChad v2.5 dropped
  `:MasonInstallAll`, and neither plugin auto-installs on its own, so the specs
  do it explicitly.
- **C and C++ preprocessor dimming** (`autocmds.lua`): branches that clangd
  reports as inactive are greyed out instead of highlighted like comments.

## Credits

NvChad, and [LazyVim's starter](https://github.com/LazyVim/starter), which the
NvChad starter this began as was modeled on.
