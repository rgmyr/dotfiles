#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  OS="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS="linux"
else
  echo -e "${RED}❌ Unsupported OS: $OSTYPE${NC}"
  exit 1
fi

echo -e "${BLUE}Setting up dotfiles for $OS${NC}"

# Install chezmoi if not present
if ! command -v chezmoi &>/dev/null; then
  echo -e "${YELLOW}Installing chezmoi...${NC}"
  if [[ "$OS" == "macos" ]]; then
    # Install Homebrew if not present
    if ! command -v brew &>/dev/null; then
      echo -e "${YELLOW}Installing Homebrew...${NC}"
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      # Add Homebrew to PATH for Apple Silicon Macs
      if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
    fi
    brew install chezmoi
  else
    # Linux installation
    sudo apt update
    sudo apt install -y curl
    curl -sfL https://git.io/chezmoi | sh
    sudo mv ./bin/chezmoi /usr/local/bin/
  fi
fi

# Initialize chezmoi with this repository
REPO_URL="${1:-https://github.com/rgmyr/dotfiles.git}"

if [[ -d "$HOME/.local/share/chezmoi" ]]; then
  echo -e "${YELLOW}Chezmoi directory exists, pulling latest changes...${NC}"
  chezmoi git pull
else
  echo -e "${YELLOW}Initializing chezmoi with repository...${NC}"
  chezmoi init --apply "$REPO_URL"
fi

echo -e "${GREEN}Dotfiles setup complete!${NC}"
echo -e "${BLUE}Next steps:${NC}"
echo "  • Run 'exec zsh' to start using new shell configuration"
echo "  • Open nvim to let LazyVim install plugins automatically"
echo "  • Use 'chezmoi edit ~/.zshrc' to customize your shell further"
