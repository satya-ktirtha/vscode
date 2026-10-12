#!/bin/bash

# Target directory for code-server user settings
TARGET_DIR="$HOME/.local/share/code-server/User"
mkdir -p "$TARGET_DIR"

# Copy configuration files if they exist
if [ -f "settings.json" ]; then
  cp -f settings.json "$TARGET_DIR/settings.json"
fi

if [ -f "keybindings.json" ]; then
  cp -f keybindings.json "$TARGET_DIR/keybindings.json"
fi

# Loop through extensions.txt and install each extension into code-server
if [ -f "extensions.txt" ]; then
  while IFS= read -r extension || [ -n "$extension" ]; do
    # Ignore empty lines or comments starting with #
    if [ -n "$extension" ] && [[ ! "$extension" =~ ^# ]]; then
      echo "Installing extension: $extension"
      code-server --install-extension "$extension"
    fi
  done < extensions.txt
fi
