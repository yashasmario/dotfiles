#!/bin/bash

set -euo pipefail

DEST="$HOME/.dotfiles"

DIRS=(
    "$HOME/.config/nvim"
    "$HOME/.config/tmux"
    "$HOME/.config/sioyek"
    "$HOME/.config/alacritty"
    "$HOME/.scripts"
    "$HOME/.zshrc"
)

mkdir -p "$DEST"

for dir in "${DIRS[@]}"; do
    if [[ -e "$dir" ]]; then
        echo "Copying $dir..."

        if [[ -d "$dir" ]]; then
            name="$(basename "$dir")"
            mkdir -p "$DEST/$name"

            tar -C "$dir" \
                --exclude='.git' \
                -cf - . |
                tar -C "$DEST/$name" -xf -
        else
            cp -p "$dir" "$DEST/"
        fi
    else
        echo "Skipping $dir (not found)"
    fi
done

echo "^Done. Dotfiles copied to $DEST"
