# `rgmyr.files`

Cross-platform dotfile setup for macOS and Debian-based systems, managed with [chezmoi](https://chezmoi.io). Intending to add Windows support to the extent possible, or at least verify Debain setup works in WSL.

## How Chezmoi Works

Chezmoi is a dotfile manager that uses templates to adapt configurations for different machines. It detects OS, architecture, and environment, then generates the right paths and settings. For example, we automatically use `/opt/homebrew` on Apple Silicon Macs and `/usr/local` on Intel Macs or when running under Rosetta 2.

## Priorities

- **Modern CLI tools** that improve on traditional Unix commands
- **`vim`-centric workflows** with VSCode keybinding compatibility
- **Terminal multiplexing** with `tmux`
- **AI-assisted development** (tbd, interested in `supermaven`, `cursor-cli`, `aider`, `avante.nvim`)

## Installation

### One-Liner
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rgmyr
```

### Manual Installation
```bash
# Install chezmoi
brew install chezmoi  # macOS
# OR
curl -sfL https://git.io/chezmoi | sh && sudo mv ./bin/chezmoi /usr/local/bin/  # Linux

# Initialize with this repository
chezmoi init --apply https://github.com/rgmyr/dotfiles.git

# Start using the configuration
exec zsh
tmux new -s work
```

## 🛠️ What Gets Installed

### Core Applications
- **[Zsh](https://www.zsh.org/)** + [Oh-my-zsh](https://ohmyz.sh/)
- **[Neovim](https://neovim.io/)** with [LazyVim](https://www.lazyvim.org/)
- **[tmux](https://github.com/tmux/tmux/wiki)** terminal multiplexer
- **[fzf](https://junegunn.github.io/fzf/)** (fuzzy finder for everything)

**LazyVim is temporarily disabled until I can get the automatic setup working without creating `lspserver` or `globalleader` issues.**

### Modern CLI Tools (Rust-powered)
| Traditional | Modern | Purpose |
|------------|---------|---------|
| `ls` | `eza` | File listing with icons and git status |
| `cat` | `bat` | File viewing with syntax highlighting |
| `find` | `fd` | Fast file finding |
| `grep` | `rg` (ripgrep) | Fast text search |
| `cd` | `z` (zoxide) | Smart directory jumping |
| File manager | `yazi` | Terminal-based file explorer |

### Development Tools
- **Git** with enhanced aliases
- **[uv](https://docs.astral.sh/uv/)** for Python management
- **Node.js** + npm for JS/TS
- **Docker** integration and shortcuts

## Commands & Keybindings

### 🐚 Zsh (Shell)
```bash
# Smart navigation
z myproject          # Jump to frequently used directory
ll                   # Enhanced ls with icons and git info
..                   # Go up one directory
...                  # Go up two directories

# File operations
bat file.txt         # View file with syntax highlighting
fd "*.js" src/       # Find JavaScript files in src/
rg "function" --type js  # Search for "function" in JS files
yazi                 # Open file manager

# Git shortcuts
gs                   # git status
gp                   # git pull
gl                   # git log --oneline -10
gco branch-name      # git checkout
gb                   # git branch

# Docker shortcuts
dps                  # docker ps
dcup                 # docker compose up -d
dcdown               # docker compose down
dclogs               # docker compose logs -f

# Utilities
env-info            # Show current environment info
docker-logs         # Interactive container log viewer
reload              # Reload zsh configuration
```

### ⌨️  vim/nvim Keybindings
```bash
# Custom mappings
jj                  # Escape from insert mode
;                   # Enter command mode (instead of :)

# VSCode-like shortcuts
Ctrl+s              # Save file
Ctrl+p              # Find files (Telescope)
Ctrl+Shift+p        # Command palette
Ctrl+Shift+f        # Global search
Ctrl+/              # Toggle comments
Shift+Tab           # Jump out of brackets/quotes (insert mode)

# LazyVim leaders (space-prefixed)
<space>ff           # Find files
<space>fg           # Live grep
<space>fb           # Switch buffers
<space>gg           # Open lazygit
<space>rc           # Edit keymaps with chezmoi
```

### 🖥️ tmux (Terminal Multiplexer)

The `tmux server` is a local process that manages:

- multiple ongoing terminal sessions (like an instance of a terminal emulator)
- each with multiple windows (like tabs within a session)
- each having one or more panes arranged in an arbitrary grid
- sessions and windows can be named
- panes can be quickly split, unsplit, and resized

#### Session Management
```bash
# Outside tmux
tmux new -s myproject     # Create named session
tmux ls                   # List all sessions
tmux attach -t myproject  # Attach to existing session
tmux kill-session -t myproject

# Inside tmux (Prefix: Ctrl+a)
Ctrl+a d                  # Detach (keeps session running)
Ctrl+a s                  # Switch between sessions
Ctrl+a $                  # Rename current session
Ctrl+a X                  # Kill current session (with confirmation)
```

#### Window Management
```bash
Ctrl+a c                  # Create new window
Ctrl+a n                  # Next window
Ctrl+a p                  # Previous window
Ctrl+a 0-9                # Switch to window number
Ctrl+a ,                  # Rename window
Ctrl+a &                  # Kill window
Shift+Left/Right          # Switch windows (no prefix needed)
```

#### Pane Management (Split screen)
```bash
Ctrl+a |                  # Split vertically (custom binding)
Ctrl+a -                  # Split horizontally (custom binding)
Ctrl+a h/j/k/l            # Navigate panes (vim-style)
Ctrl+a H/J/K/L            # Resize panes
Ctrl+a z                  # Zoom/unzoom current pane
Ctrl+a x                  # Kill current pane
Ctrl+a Space              # Cycle through pane layouts
```

#### Power User Commands
```bash
Ctrl+a e                  # Synchronize panes (type in all at once)
Ctrl+a r                  # Reload tmux config
Ctrl+a [                  # Enter copy mode (vim-like scrolling)
```

### 🔍 Advanced File Navigation

#### fzf (Fuzzy Finder)
```bash
Ctrl+r                    # Search command history
Ctrl+t                    # Insert file path at cursor
Alt+c                     # Change to selected directory

# In fzf interface
Tab                       # Multi-select
Shift+Tab                 # Deselect
Enter                     # Confirm selection
Esc                       # Cancel
```

#### fd (Find Files)
```bash
fd pattern                # Find files/directories matching pattern
fd -e py                  # Find only Python files  
fd -t f pattern           # Find only files (not directories)
fd -t d pattern           # Find only directories
fd -H pattern             # Include hidden files
```

#### ripgrep (Search in Files)
```bash
rg "pattern"              # Search for text in all files
rg "pattern" --type js    # Search only in JavaScript files
rg -i "pattern"           # Case-insensitive search
rg -v "pattern"           # Invert match (show lines that don't match)
rg -n "pattern"           # Show line numbers
rg -C 3 "pattern"         # Show 3 lines of context
```

### 📁 File Management with Yazi
```bash
yazi                      # Open file manager
# Inside yazi:
h/j/k/l                   # Navigate (vim-style)
Enter                     # Open file/directory
q                         # Quit
Space                     # Select/deselect
a                         # Create new file
A                         # Create new directory
d                         # Delete selected
r                         # Rename
y                         # Copy
x                         # Cut
p                         # Paste
```

## 🤖 Future: AI Integration

Possible AI assistance tools:
- **Aider**: Terminal-based AI pair programming
- **Supermaven**: Fast AI completion in Neovim
- **Cursor CLI**: Command-line version of Cursor's AI features
- **avante.nvim**: Neovim plugin for AI-assisted development

## 🔧 Customization & Management

### Editing Configurations
```bash
# Edit any config with chezmoi
chezmoi edit ~/.zshrc     # Shell configuration
chezmoi edit ~/.tmux.conf # tmux settings
chezmoi edit ~/.config/nvim/lua/config/keymaps.lua  # Neovim keymaps

# Apply changes
chezmoi apply
```

### Updating Your Setup
```bash
# Pull latest changes from your dotfiles repo
chezmoi update

# Or manually
chezmoi git pull
chezmoi apply
```

### Backup & Recovery
```bash
backup-dotfiles           # Create timestamped backup
chezmoi status            # See what's changed
chezmoi diff              # See exact differences
```


