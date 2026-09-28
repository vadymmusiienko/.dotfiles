# Git Configuration

**Links:** [Documentation](https://git-scm.com/docs)

Global git config, split into two files:

- `config` is linked to `~/.config/git/config`, the XDG location git reads
  instead of `~/.gitconfig`
- `ignore` is the global ignore file, pointed at by `core.excludesfile`

## Setup

- `brew install git` (included in the Brewfile)
- Identity lives in the `[user]` block. Change the name and email there before
  using this config as your own.
- Two helpers are expected on PATH, both in the Brewfile:
  `diff-so-fancy` for diff formatting and `git-lfs` for large files.

## What this config does

- **Identity**: name and email, with a second commented-out email for switching
  to a school or work address.
- **Editor**: `nvim -c "startinsert"`, so commit messages open ready to type.
- **Pager**: `diff-so-fancy | less --tabs=4 -RF`, and the same filter in
  `interactive.diffFilter` so `git add -p` looks the same as `git diff`.
- **Diff tool**: VS Code, via `git difftool`.
- **Line endings**: `autocrlf = input`, which strips CRLF on commit.
- **Default branch**: `main`.
- **Colors**: a full palette for diffs, including `diff-highlight` colors that
  diff-so-fancy reads.
- **LFS**: the standard git-lfs filter block.

## Global ignore file

`ignore` covers what should never be committed from any repo on this machine:
macOS metadata (`.DS_Store`), editor directories (`.vscode/`, `.idea/`), swap
files, `.env`, and `**/.claude/settings.local.json`.

## Custom commands

`bin/` in this repo adds git subcommands to PATH:

- `git uncommit` - undo the last commit, keep the changes staged
- `git unpushed` - diff of everything not yet pushed on this branch
- `git wtf` - summary of how the current branch relates to its remote and to
  other branches (third-party, GPLv3, see the header in the file)
