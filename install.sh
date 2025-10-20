#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link_file() {
    local src="$1"
    local dst="$2"

    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
        echo "Already linked: $dst"
        return
    fi

    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        mv "$dst" "${dst}.bak"
        echo "Existing file backed up: ${dst}.bak"
    elif [ -L "$dst" ]; then
        rm -f "$dst"
    fi

    ln -s "$src" "$dst"
    echo "Linked $dst → $src"
}

echo "Setting up dotfiles from: $DOTFILES_DIR"

link_file "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
link_file "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

current_shell="$(basename "$SHELL" 2>/dev/null || echo "")"

if [ "$current_shell" = "fish" ]; then
    mkdir -p "$HOME/.config/fish/functions"
    for f in "$DOTFILES_DIR/fish/functions/"*; do
        dst="$HOME/.config/fish/functions/$(basename "$f")"
        link_file "$f" "$dst"
    done
fi

echo "All dotfiles installed successfully."
