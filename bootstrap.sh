#!/bin/bash
#
# Launchpad Bootstrap Script
# Sets up Claude Code / Codex configuration in the current directory
#

set -e

LAUNCHPAD_URL="https://raw.githubusercontent.com/YOUR_USER/launchpad/main"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo "🚀 Launchpad - Setting up your project..."
echo ""

# Check if already configured
if [ -f "AGENTS.md" ]; then
    echo -e "${YELLOW}⚠️  AGENTS.md already exists.${NC}"
    read -p "Overwrite existing configuration? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 1
    fi
fi

# Create directory structure
echo "Creating directory structure..."
mkdir -p .claude/rules
mkdir -p docs/decisions

# Download or copy files
if command -v curl &> /dev/null && [ "$1" != "--local" ]; then
    echo "Downloading configuration files..."
    curl -fsSL "$LAUNCHPAD_URL/CLAUDE.md" -o CLAUDE.md
    curl -fsSL "$LAUNCHPAD_URL/AGENTS.md" -o AGENTS.md
    curl -fsSL "$LAUNCHPAD_URL/PROJECT_CONTEXT.md" -o PROJECT_CONTEXT.md
    curl -fsSL "$LAUNCHPAD_URL/.claudeignore" -o .claudeignore
    curl -fsSL "$LAUNCHPAD_URL/.claude/rules/architecture.md" -o .claude/rules/architecture.md
    curl -fsSL "$LAUNCHPAD_URL/.claude/rules/testing.md" -o .claude/rules/testing.md
else
    echo -e "${RED}Error: curl not found. Please copy files manually.${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}✅ Launchpad configuration installed!${NC}"
echo ""
echo "Next steps:"
echo "  1. Edit PROJECT_CONTEXT.md with your project details"
echo "  2. Run your first command with Claude Code or Codex"
echo ""

# Validate placeholder check
if grep -q "\[PROJECT_NAME\]" PROJECT_CONTEXT.md 2>/dev/null; then
    echo -e "${YELLOW}⚠️  Remember: Edit PROJECT_CONTEXT.md before starting work.${NC}"
    echo "   The agent will remind you if you forget."
fi

echo ""
echo "🎉 Happy building!"
