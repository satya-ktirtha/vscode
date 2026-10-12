#!/bin/bash

# Target directory for code-server user settings
TARGET_DIR="$HOME/.local/share/code-server/User"

# Create the directory if it doesn't exist yet
mkdir -p "$TARGET_DIR"

# Copy settings.json and keybindings.json into code-server directory
if [ -f "settings.json" ]; then
  cp -f settings.json "$TARGET_DIR/settings.json"
fi

if [ -f "keybindings.json" ]; then
  cp -f keybindings.json "$TARGET_DIR/keybindings.json"
fi

# Optional: Automatically install your favorite VS Code extensions
# code-server --install-extension dracula-theme.theme-dracula
# code-server --install-extension esbenp.prettier-vscode
