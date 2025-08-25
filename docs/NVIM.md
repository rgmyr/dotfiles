# Neovim Keybindings Reference

This document lists all available keybindings in your Neovim configuration, including custom keymaps and LazyVim defaults.

## Table of Contents

- [Custom Keybindings](#custom-keybindings)
- [LazyVim Default Keybindings](#lazyvim-default-keybindings)
  - [File Operations](#file-operations)
  - [Navigation](#navigation)
  - [Editing](#editing)
  - [Search & Replace](#search--replace)
  - [Git Operations](#git-operations)
  - [LSP & Code Actions](#lsp--code-actions)
  - [Terminal](#terminal)
  - [UI & Windows](#ui--windows)
  - [Telescope (Fuzzy Finder)](#telescope-fuzzy-finder)
  - [Neo-tree (File Explorer)](#neo-tree-file-explorer)
  - [Trouble (Diagnostics)](#trouble-diagnostics)
  - [Lazy (Plugin Manager)](#lazy-plugin-manager)

---

## Custom Keybindings

These are your personal customizations that override or extend LazyVim defaults.

### Insert Mode
| Key | Action | Description |
|-----|--------|-------------|
| `jj` | Escape | Quick escape from insert mode |

### Normal Mode
| Key | Action | Description |
|-----|--------|-------------|
| `;` | `:` | Quick command mode access |
| `d` | Delete without yank | Delete text without copying to clipboard |
| `D` | Delete line without yank | Delete entire line without copying |
| `<leader>rc` | Edit keymaps | Open keymaps.lua in chezmoi for editing |

### Terminal
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>tf` | Float terminal | Open terminal in floating window |
| `<leader>th` | Horizontal terminal | Open terminal in horizontal split |
| `<leader>tv` | Vertical terminal | Open terminal in vertical split |
| `<C-\>` | Toggle terminal | Toggle terminal with current direction |

---

## LazyVim Default Keybindings

### File Operations
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>w` | Save | Save current file |
| `<leader>q` | Quit | Close current window/buffer |
| `<leader>W` | Save all | Save all modified files |
| `<leader>Q` | Quit all | Close all windows and quit |

### Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<C-h>` | Left window | Move to window on the left |
| `<C-j>` | Down window | Move to window below |
| `<C-k>` | Up window | Move to window above |
| `<C-l>` | Right window | Move to window on the right |
| `<leader>h` | Left window | Alternative left window navigation |
| `<leader>j` | Down window | Alternative down window navigation |
| `<leader>k` | Up window | Alternative up window navigation |
| `<leader>l` | Right window | Alternative right window navigation |
| `<leader>w` | Next window | Switch to next window |

### Buffer Management
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>bn` | Next buffer | Switch to next buffer |
| `<leader>bp` | Previous buffer | Switch to previous buffer |
| `<leader>bd` | Delete buffer | Delete current buffer |
| `<leader>bl` | List buffers | Show buffer list |

### Tab Management
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>tn` | Next tab | Switch to next tab |
| `<leader>tp` | Previous tab | Switch to previous tab |
| `<leader>tc` | Close tab | Close current tab |
| `<leader>to` | New tab | Open new tab |

### Editing
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>/` | Toggle comment | Toggle comment on current line |
| `<leader>u` | Undo tree | Open undo tree visualization |
| `<leader>y` | Copy line | Copy current line to clipboard |
| `<leader>Y` | Copy to end | Copy from cursor to end of line |

### Search & Replace
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>s` | Search | Search in current buffer |
| `<leader>S` | Search word | Search for word under cursor |
| `<leader>sr` | Replace | Search and replace in current buffer |
| `<leader>sw` | Replace word | Replace word under cursor |

### Git Operations
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>g` | Git menu | Open git operations menu |
| `<leader>gb` | Git blame | Show git blame for current line |
| `<leader>gd` | Git diff | Show git diff for current file |
| `<leader>gs` | Git status | Open git status view |
| `<leader>gc` | Git commit | Open git commit interface |
| `<leader>gp` | Git push | Push current branch |
| `<leader>gl` | Git log | Show git log |

### LSP & Code Actions
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Go to definition | Go to definition of symbol under cursor |
| `gr` | Go to references | Show references to symbol under cursor |
| `gi` | Go to implementation | Go to implementation of symbol |
| `gt` | Go to type definition | Go to type definition of symbol |
| `K` | Hover | Show hover information for symbol |
| `<leader>ca` | Code action | Show available code actions |
| `<leader>cr` | Rename | Rename symbol under cursor |
| `<leader>cf` | Format | Format current buffer |
| `<leader>cd` | Show diagnostics | Show diagnostics for current buffer |

### Terminal
| Key | Action | Description |
|-----|--------|-------------|
| `<C-\>` | Toggle terminal | Toggle terminal (custom mapping) |
| `<leader>tf` | Float terminal | Open terminal in float (custom mapping) |
| `<leader>th` | Horizontal terminal | Open terminal in horizontal split (custom mapping) |
| `<leader>tv` | Vertical terminal | Open terminal in vertical split (custom mapping) |

### UI & Windows
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>e` | File explorer | Toggle Neo-tree file explorer |
| `<leader>f` | Find files | Open Telescope fuzzy finder |
| `<leader>h` | Help | Open help |
| `<leader>m` | Mason | Open Mason plugin manager |
| `<leader>n` | Noice | Open Noice UI |
| `<leader>p` | Projects | Open project switcher |
| `<leader>r` | Restore | Restore session |
| `<leader>t` | Terminal | Open terminal |
| `<leader>v` | View | Toggle view options |

### Telescope (Fuzzy Finder)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>f` | Find files | Find files in current directory |
| `<leader>F` | Find files (git) | Find files tracked by git |
| `<leader>g` | Live grep | Search for text in files |
| `<leader>G` | Live grep (git) | Search for text in git-tracked files |
| `<leader>b` | Buffers | Switch between open buffers |
| `<leader>h` | Help tags | Search help documentation |
| `<leader>m` | Marks | Show and navigate marks |
| `<leader>o` | Old files | Show recently opened files |
| `<leader>r` | Registers | Show and select registers |
| `<leader>s` | Symbols | Search for symbols in workspace |

### Neo-tree (File Explorer)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>e` | Toggle | Toggle file explorer |
| `<space>` | Toggle node | Expand/collapse directory |
| `<CR>` | Open | Open file or expand directory |
| `<C-v>` | Split | Open file in vertical split |
| `<C-s>` | Split | Open file in horizontal split |
| `<C-t>` | Tab | Open file in new tab |
| `a` | Add | Add new file |
| `A` | Add directory | Add new directory |
| `d` | Delete | Delete file/directory |
| `r` | Rename | Rename file/directory |
| `y` | Copy | Copy file/directory |
| `x` | Cut | Cut file/directory |
| `p` | Paste | Paste file/directory |
| `q` | Close | Close file explorer |

### Trouble (Diagnostics)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>xx` | Toggle | Toggle diagnostics window |
| `<leader>xw` | Workspace | Show workspace diagnostics |
| `<leader>xd` | Document | Show document diagnostics |
| `<leader>xq` | Quickfix | Show quickfix list |
| `<leader>xl` | Location | Show location list |

### Lazy (Plugin Manager)
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>L` | Lazy | Open Lazy plugin manager |
| `<leader>li` | Install | Install missing plugins |
| `<leader>lu` | Update | Update plugins |
| `<leader>ls` | Sync | Sync plugin configuration |
| `<leader>lc` | Check | Check for updates |
| `<leader>ll` | Log | Show plugin logs |

---

## Mode-Specific Keybindings

### Visual Mode
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>/` | Comment | Toggle comment on selected lines |
| `<leader>y` | Copy | Copy selected text |
| `<leader>d` | Delete | Delete selected text |
| `<leader>r` | Replace | Replace selected text |

### Command Mode
| Key | Action | Description |
|-----|--------|-------------|
| `<C-n>` | Next | Next completion item |
| `<C-p>` | Previous | Previous completion item |
| `<C-f>` | Forward | Scroll completion forward |
| `<C-b>` | Backward | Scroll completion backward |

---

## Plugin-Specific Keybindings

### Supermaven (AI Assistant)
| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl+Shift+I` | Inline edit | Inline edit with AI |
| `Ctrl+Shift+L` | Chat | Open AI chat |
| `Ctrl+Shift+C` | Complete | Complete code with AI |

---

## Tips for Using Keybindings

1. **Leader Key**: Most custom keybindings use `<leader>` which is set to `<Space>`
2. **Mode Awareness**: Some keybindings only work in specific modes (Normal, Visual, Insert)
3. **Context Sensitivity**: Some keybindings change behavior based on context (e.g., file type)
4. **Discoverability**: Use `:help keymaps` or `<leader>L` to explore available keybindings
5. **Customization**: Add your own keybindings in `~/.config/nvim/lua/config/keymaps.lua`

---

## Adding New Keybindings

To add new keybindings, edit the file:
```
~/.config/nvim/lua/config/keymaps.lua
```

Example:
```lua
-- Add new keybinding
vim.keymap.set("n", "<leader>xx", "<cmd>SomeCommand<cr>", { desc = "Description" })
```

---

*This reference covers the current configuration. For the most up-to-date information, check the LazyVim documentation or use `:help` commands in Neovim.*
