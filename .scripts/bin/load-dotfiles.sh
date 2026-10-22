#!/bin/bash

set -euo pipefail

SRC="$HOME/.dotfiles"
CONFIG="$HOME/.config"

for item in "$SRC"/* "$SRC"/.[!.]* "$SRC"/..?*; do
    # Skip unmatched globs
    [[ -e "$item" ]] || continue

    name="$(basename "$item")"

    # Skip Git metadata
    [[ "$name" == ".git" ]] && continue

    if [[ "$name" == .* ]]; then
        DEST="$HOME"
    else
        DEST="$CONFIG"
    fi

    echo "Loading $name into $DEST..."

    if [[ -d "$item" ]]; then
        mkdir -p "$DEST/$name"

        tar -C "$item" \
            --exclude='.git' \
            -cf - . |
            tar -C "$DEST/$name" -xf -
    else
        cp -p "$item" "$DEST/"
    fi
done

echo "Done. Dotfiles restored."
