# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A chezmoi-managed cross-platform dotfiles repository (macOS + Linux/Debian). Chezmoi maps `dot_*` files to `~/.*` and `dot_config/` to `~/.config/`. Files ending in `.tmpl` use Go templates with variables from `.chezmoi.toml.tmpl`.

## Key Commands

```bash
chezmoi apply          # Deploy dotfiles to home directory
chezmoi diff           # Preview what would change
chezmoi edit <file>    # Edit a managed file (opens source in chezmoi dir)
chezmoi add <file>     # Start managing a new dotfile
chezmoi re-add         # Re-add all modified managed files
```

After editing templates, always run `chezmoi diff` to verify output before `chezmoi apply`.

## Template System

`.chezmoi.toml.tmpl` defines template variables based on OS/architecture detection:
- `{{ .chezmoi.os }}` — `darwin` or `linux`
- `{{ .chezmoi.arch }}` — `arm64` or `amd64`
- `{{ .fzf_path }}`, `{{ .package_manager }}`, `{{ .brew_prefix }}` — derived paths

Conditional blocks use `{{- if eq .chezmoi.os "darwin" }}` / `{{- else }}` / `{{- end }}`.

## Architecture

| Source file | Deploys to | Purpose |
|---|---|---|
| `dot_zshrc.tmpl` | `~/.zshrc` | Shell config (oh-my-zsh, aliases, functions, theming) |
| `dot_tmux.conf` | `~/.tmux.conf` | tmux with `Ctrl+s` prefix, vim nav, TPM plugins |
| `dot_vimrc` | `~/.vimrc` | Vim fallback config |
| `dot_config/nvim/` | `~/.config/nvim/` | Neovim with LazyVim, custom theme manager |
| `dot_config/base16-shell/` | `~/.config/base16-shell/` | Terminal color schemes |

### Run-once scripts (execute once per machine)

- `run_once_install-packages.sh.tmpl` — Installs brew/apt packages, Rust, uv, modern CLI tools
- `run_once_setup-shell.sh.tmpl` — Oh-my-zsh + plugins
- `run_once_setup-nvim.sh.tmpl` — Validates Neovim + LazyVim setup
- `run_once_setup-tmux.sh.tmpl` — TPM bootstrap

## Shell Aliases to Be Aware Of

Several standard commands are aliased to modern replacements in `dot_zshrc.tmpl`:
- `ls` → `eza`, `find` → `fd`, `cd` → `z` (zoxide)
- `tmux` → `tmux -f ~/.tmux.conf` (explicit config path)

## Neovim Config Structure

`dot_config/nvim/lua/config/` — options, keymaps, lazy.nvim bootstrap, theme-manager (persists theme choice to disk). `dot_config/nvim/lua/plugins/` — plugin specs (themes, autopairs, ai-tools). Uses LazyVim distribution; requires Neovim 0.8+.

## Git Settings

`autoCommit` and `autoPush` are enabled in `.chezmoi.toml` — chezmoi auto-commits and pushes on `chezmoi edit` or `chezmoi add`.
