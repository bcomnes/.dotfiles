#!/bin/bash
# Setup script to configure Git clean/smudge filters for redacting secrets

set -e

# Get the absolute path to the dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up Git clean/smudge filters for secret redaction..."

# Configure the clean filter (runs when staging files for commit)
git config filter.redact-secrets.clean "$DOTFILES_DIR/git-clean-secrets.sh"

# Configure the smudge filter (runs when checking out files)
git config filter.redact-secrets.smudge "$DOTFILES_DIR/git-smudge-secrets.sh"

# Make the filter required (prevents checkout if filter fails)
git config filter.redact-secrets.required true

echo "✅ Git filters configured successfully!"
echo ""
echo "The following filters have been set up:"
echo "  - Clean filter: $DOTFILES_DIR/git-clean-secrets.sh"
echo "  - Smudge filter: $DOTFILES_DIR/git-smudge-secrets.sh"
echo ""
echo "Your Zed settings file will now:"
echo "  - Automatically redact API keys before committing"
echo "  - Show REDACTED placeholders when checking out on new machines"
echo ""
echo "⚠️  IMPORTANT: After checking out on a new machine, manually replace"
echo "    REDACTED values in configs/config/zed/settings.json with your real API keys"
