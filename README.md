# `rgmyr.files`

Cross-platform setup scripts and config files for Unix-like (macOS, Debian) machines, managed with [chezmoi](https://chezmoi.io).

Sort of supports WSL - have to manually install `zsh-history-substring-search`, a newer version of `neovim`, there's some hacks to silence warnings about `zsh` docker completions symlinking, etc.

## The Setup

- **Modern CLI tools** that offer improved versions of traditional Unix commands
    - `eza, bat, ripgrep, fzf, zoxide, yazi` etc.
    - Aliasing `ls/ll -> eza, find -> fd, cd -> z`
    - Leaving `cat`, `grep` accessible (use `bat`, `rg` directly)
- **[Base16](https://github.com/RRethy/nvim-base16)** for consistent colors across terminals and easy switching
    - `theme github`: `base16-github-dark-dimmed` (default)
    - `theme solarized`: `base16-solarized-light`
    - `theme rgmyr`: a custom theme, similar to solarized dark but a little easier on the eyes
    - Many other public themes available, see [the project repo](https://github.com/RRethy/nvim-base16).
- **[Neovim](https://neovim.io/)** with [LazyVim](https://www.lazyvim.org/) for managing plugins, keymaps, and options
    - `jj` to escape from insert mode, `;` to enter command mode 
    - Collection of themes mapped to `<leader>` + `tg, ts, tt, tc` (github, solarized, tokyonight, catppuccin, etc.)
- **Terminal multiplexing** with [tmux](https://github.com/tmux/tmux/wiki)
    - `Ctrl+s` prefix instead of default `Ctrl+b`
    - `|` and `-` to split panes, rather than `%` and `"`
    - `vim`-style keybindings for pane navigation (`hjkl`) and resizing (`HJKL`)
    - Shell helpers: `tm`, `tp`, `tv`, `tn` for quick session management
    - TPM plugins: resurrect, continuum (auto-save), fuzzback (fzf scrollback), fzf-url
- `uv` for Python
- `node` and `npm` for JS/TS
- `docker` integration and shortcuts
- `git` with enhanced aliases

## Installation

### One-Liner Installation
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
chezmoi init --apply rgmyr

# Start using the configuration
exec zsh
tmux new -s work
```

## Commands & Keybindings

### Zsh
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

# Tmux session helpers
tm                   # Create/attach session named after current dir
tm myproject         # Create/attach session named "myproject"
tp                   # Fuzzy-pick a tmux session with fzf
tv                   # Create/attach session with $EDITOR (neovim)
tv src/              # Same, but open editor at specific path
tn myproject         # Create a named session (alias for tm)

# Utilities
env-info            # Show current environment info
docker-logs         # Interactive container log viewer
reload              # Reload zsh configuration
```

### `vim`/`nvim` Keybindings
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

### `tmux`

#### Session Management
```bash
# Shell helpers (no prefix needed, work outside and inside tmux)
tm                        # Create/attach session named after $PWD
tm myproject              # Create/attach named session
tp                        # Fuzzy-pick session with fzf
tv                        # Session with $EDITOR opened
tn myproject              # Create named session (alias for tm)

# Raw tmux commands
tmux new -s myproject     # Create named session
tmux ls                   # List all sessions
tmux attach -t myproject  # Attach to existing session
tmux kill-session -t myproject

# Inside tmux (Prefix: Ctrl+s)
Ctrl+s d                  # Detach (keeps session running)
Ctrl+s S                  # Choose session from list
Ctrl+s N                  # Create new session (prompts for name)
Ctrl+s $                  # Rename current session
Ctrl+s X                  # Kill current session (with confirmation)
```

#### Window Management
```bash
Ctrl+s c                  # Create new window
Ctrl+s n                  # Next window
Ctrl+s p                  # Previous window
Ctrl+s 0-9                # Switch to window number
Ctrl+s ,                  # Rename window
Ctrl+s &                  # Kill window
Shift+Left/Right          # Switch windows (no prefix needed)
```

#### Pane Management (Split screen)
```bash
Ctrl+s |                  # Split vertically (custom binding)
Ctrl+s -                  # Split horizontally (custom binding)
Ctrl+s h/j/k/l            # Navigate panes (vim-style)
Ctrl+s H/J/K/L            # Resize panes
Ctrl+s z                  # Zoom/unzoom current pane
Ctrl+s x                  # Kill current pane
Ctrl+s Space              # Cycle through pane layouts
```

#### Copy Mode (vi-style)
```bash
Ctrl+s [                  # Enter copy mode (vim-like scrolling)
v                         # Begin selection
C-v                       # Toggle rectangle selection
y                         # Copy selection (stays in copy mode)
Enter                     # Copy selection and exit copy mode
```

#### Power User Commands
```bash
Ctrl+s e                  # Synchronize panes (type in all at once)
Ctrl+s i                  # Pull last pane into current window
Ctrl+s r                  # Reload tmux config
Alt+k                     # Smart clear (no prefix needed):
                          #   In shell: clears screen + scrollback
                          #   In programs (nvim, etc.): sends Ctrl+l
```

#### Plugins (managed by TPM)
```bash
Ctrl+s I                  # Install/update plugins
Ctrl+s U                  # Update plugins
```

Installed plugins:
- **tmux-resurrect**: Save/restore sessions across reboots (`Ctrl+s Ctrl+s` save, i.e. prefix twice; `Ctrl+s Ctrl+r` restore)
- **tmux-continuum**: Auto-saves sessions every 15 minutes
- **tmux-fuzzback**: `Ctrl+s /` to fzf-search scrollback history
- **tmux-fzf-url**: `Ctrl+s u` to fzf-pick URLs from scrollback
- **base16-tmux**: Consistent theming with base16 colors

### Advanced File Navigation

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

#### fd
```bash
fd pattern                # Find files/directories matching pattern
fd -e py                  # Find only Python files  
fd -t f pattern           # Find only files (not directories)
fd -t d pattern           # Find only directories
fd -H pattern             # Include hidden files
```

#### ripgrep
```bash
rg "pattern"              # Search for text in all files
rg "pattern" --type js    # Search only in JavaScript files
rg -i "pattern"           # Case-insensitive search
rg -v "pattern"           # Invert match (show lines that don't match)
rg -n "pattern"           # Show line numbers
rg -C 3 "pattern"         # Show 3 lines of context
```

### File Management with Yazi
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

## Customization & Management

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



