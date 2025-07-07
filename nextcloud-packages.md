# CLI Tools Package List

## Shell & Terminal

### Shell Options (Choose Your Preference)
- **Fish** - Smart shell with autocompletion and syntax highlighting (CachyOS default)
- **Zsh + Oh-My-Zsh** - Highly customizable shell with POSIX compatibility (CachyOS pre-configured)
- **Starship** - Fast, customizable cross-shell prompt with git integration

### Terminal Multiplexers (Choose Your Preference)  
- **Tmux** - Battle-tested terminal multiplexer (mature, lightweight)
- **Zellij** - Modern tmux alternative with better UX (Rust-based, intuitive)

## File & Text Operations
- **Ripgrep (rg)** - Extremely fast text search tool, replacement for grep
- **Fd** - Simple, fast alternative to find with intuitive syntax
- **Bat** - Cat clone with syntax highlighting and Git integration
- **Eza** - Modern replacement for ls with colors, icons, and tree view

## Navigation & File Management
- **Zoxide** - Smarter cd command that learns your habits (z command)
- **Delta** - Syntax-highlighting pager for git and diff output

### File Managers (Choose Your Preference)
- **Ranger** - Mature terminal file manager with vim-like keybindings
- **Yazi** - Modern file manager with async I/O and better image previews

## Development Tools
- **Gitui** - Fast terminal UI for git operations
- **Tokei** - Fast code line counter supporting many languages
- **Just** - Command runner similar to make but simpler
- **Mprocs** - Run and manage multiple processes

## System & Network
- **Du-dust** - More intuitive version of du for disk usage
- **Dua** - Interactive disk usage analyzer
- **Xh** - Friendly and fast HTTP client (curl/HTTPie alternative)
- **Hyperfine** - Command-line benchmarking tool

## CachyOS Notes
- **Fish & Zsh**: Both pre-configured with equivalent functionality
- **Shell switching**: `chsh -s /usr/bin/zsh` or `chsh -s /usr/bin/fish`
- **Oh-My-Zsh**: Enhanced zsh experience with plugins and themes

## Installation Priority
🟢 **Essential**: ripgrep, fd, bat, eza, zoxide, starship, delta
🟡 **Choose One**: fish vs zsh+oh-my-zsh, tmux vs zellij, ranger vs yazi  
🟡 **Useful**: gitui, just, hyperfine, tokei, xh, du-dust, dua, mprocs