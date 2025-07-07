#!/bin/bash

# CLI Tools Installation Script
# Installs modern CLI tools for enhanced terminal experience

set -e

echo "🚀 Installing CLI Tools..."

# Check if cargo is installed
if ! command -v cargo &> /dev/null; then
    echo "❌ Cargo not found. Please install Rust first: https://rustup.rs/"
    exit 1
fi

# Function to install via cargo with fallback
install_cargo() {
    local package=$1
    local binary=${2:-$package}
    
    if command -v "$binary" &> /dev/null; then
        echo "✅ $package already installed"
        return
    fi
    
    echo "📦 Installing $package..."
    if cargo install "$package"; then
        echo "✅ $package installed successfully"
    else
        echo "❌ Failed to install $package"
    fi
}

# Function to install via package manager
install_system() {
    local package=$1
    local binary=${2:-$package}
    
    if command -v "$binary" &> /dev/null; then
        echo "✅ $package already installed"
        return
    fi
    
    echo "📦 Installing $package via system package manager..."
    
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y "$package"
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y "$package"
    elif command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm "$package"
    elif command -v brew &> /dev/null; then
        brew install "$package"
    else
        echo "❌ No supported package manager found for $package"
        return 1
    fi
}

# Function to install Oh My Zsh
install_ohmyzsh() {
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "✅ Oh My Zsh already installed"
        return
    fi
    
    echo "📦 Installing Oh My Zsh..."
    if command -v curl &> /dev/null; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    elif command -v wget &> /dev/null; then
        sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended
    else
        echo "❌ Need curl or wget to install Oh My Zsh"
        return 1
    fi
}

# Core file/text tools (high priority)
echo -e "\n🔧 Installing Core Tools..."
install_cargo "ripgrep" "rg"
install_cargo "fd-find" "fd"
install_cargo "bat"
install_cargo "eza"
install_cargo "zoxide"

# Shell and prompt
echo -e "\n🐚 Installing Shell Tools..."
install_cargo "starship"

# Optional: Install Oh My Zsh (for enhanced zsh experience)
echo -e "\n🎨 Shell Enhancement (Optional)..."
read -p "Install Oh My Zsh? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    install_ohmyzsh
fi

# Development tools
echo -e "\n⚡ Installing Development Tools..."
install_cargo "gitui"
install_cargo "git-delta" "delta"
install_cargo "tokei"
install_cargo "just"
install_cargo "mprocs"

# System utilities
echo -e "\n💾 Installing System Utilities..."
install_cargo "du-dust" "dust"
install_cargo "dua-cli" "dua"
install_cargo "hyperfine"
install_cargo "xh"

# Terminal multiplexer and file manager options
echo -e "\n📱 Installing Terminal Tools..."
install_cargo "zellij"
install_cargo "yazi-fm" "yazi"

# Install ranger via system package manager
echo -e "\n📁 Installing File Manager..."
install_system "ranger"

echo -e "\n✨ Installation complete!"
echo -e "\n📚 Next steps:"
echo -e "\n🐚 Shell Configuration:"
echo "CachyOS users: Fish and Zsh are pre-configured!"
echo "• Switch to zsh: chsh -s /usr/bin/zsh"
echo "• Switch to fish: chsh -s /usr/bin/fish"
echo -e "\n🔧 Add to your shell config (~/.zshrc, ~/.config/fish/config.fish, etc.):"
echo "   eval \"\$(zoxide init zsh)\"    # or bash/fish"
echo "   eval \"\$(starship init zsh)\""
echo -e "\n⚡ Useful aliases:"
echo "   alias ls='eza'"
echo "   alias cat='bat'"
echo "   alias find='fd'"
echo "   alias grep='rg'"
echo -e "\n🎯 Try these alternatives:"
echo "   • Terminal multiplexer: tmux vs zellij"
echo "   • File manager: ranger vs yazi"
echo "   • Shell: fish (default) vs zsh+oh-my-zsh"
echo -e "\n📖 Check nextcloud-packages.md for detailed descriptions"