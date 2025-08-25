## 🎯 Daily Workflows

### Morning Startup Routine
```bash
# 1. Start tmux session for work
tmux new -s work

# 2. Set up development environment
Ctrl+a |                  # Split for code editor
nvim .                    # Open project in neovim
Ctrl+a |                  # Split for terminal
Ctrl+a c                  # New window for server
npm run dev               # Start development server
Ctrl+a c                  # New window for git
lazygit                   # Git management UI
```

### Project Management Pattern
```bash
# Session per project approach
tmux new -s frontend      # Frontend development
tmux new -s backend       # Backend API
tmux new -s database      # Database management

# Switch between projects instantly
tmux attach -t frontend
tmux attach -t backend
```

### File Navigation Workflow
```bash
# Quick file operations
ll                        # See what's in current directory
z myproj                  # Jump to project directory  
fd "component" src/       # Find React components
rg "TODO" --type js       # Find all TODOs in JS files
bat README.md             # Preview file with highlighting
yazi                      # Browse and manage files visually
```

## 🧙‍♂️ Becoming a Terminal Wizard

### 30-Day Practice Plan

**Week 1: Foundation**
- Use tmux for everything - never work outside a session
- Practice session creation, detaching, and reattaching
- Master window switching (Ctrl+a c, Ctrl+a n/p)

**Week 2: Efficiency**
- Learn pane management (split, navigate, zoom)
- Replace all file operations with modern tools (eza, bat, fd, rg)
- Practice zoxide for navigation (stop using cd!)

**Week 3: Integration**
- Create project-specific tmux sessions
- Integrate lazygit into daily workflow
- Master fzf shortcuts (Ctrl+r, Ctrl+t, Alt+c)

**Week 4: Mastery**
- Custom tmux layouts for different project types
- Advanced file management with yazi
- Develop personal shortcuts and aliases

### Muscle Memory Priority
1. **tmux session management** - Most important for productivity
2. **Pane navigation** - Essential for multitasking
3. **Modern CLI tools** - Replace old habits with better ones
4. **fzf shortcuts** - Speed up everything
5. **Vim motions** - Transfer to all text editing

## 🌟 Pro Tips

1. **Start small**: Don't try to learn everything at once
2. **Consistency**: Use the new tools even when old ones feel faster initially
3. **Detach liberally**: Always work in tmux sessions, detach when switching contexts
4. **Zoom frequently**: `Ctrl+a z` to focus on one pane is incredibly useful
5. **Name everything**: Sessions, windows, and projects should have meaningful names
6. **Practice daily**: Dedicate 10 minutes daily to practicing keybindings

## 🆘 Troubleshooting

### tmux Issues
```bash
# Config not loading
tmux source-file ~/.tmux.conf

# Kill problematic session
tmux kill-session -t session_name

# Reset everything
tmux kill-server
```

### Tool Not Found
```bash
# Reload shell
source ~/.zshrc

# Check installation
which eza fd rg bat zoxide

# Reinstall packages
chezmoi apply --force
```

### Neovim Plugin Issues
```bash
# In neovim
:Lazy sync                # Update all plugins
:checkhealth             # Diagnose issues
```

## 📈 Success Metrics

You'll know you're becoming a terminal wizard when:
- You feel uncomfortable working outside tmux
- You instinctively use `rg` instead of `grep`
- You navigate entirely with `z` and never type full paths
- You split panes without thinking
- You detach/attach from sessions seamlessly
- VSCode starts feeling slow compared to your terminal setup

**Remember**: This is a journey, not a destination. Every expert was once a beginner who kept practicing! 🚀
