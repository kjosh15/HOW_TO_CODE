#!/bin/bash
#
# HOW_TO_CODE Bootstrap Script
# Sets up Claude Code configuration in the current directory
#

set -e

REPO_URL="https://raw.githubusercontent.com/kjosh15/HOW_TO_CODE/main"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo "🚀 HOW_TO_CODE - Setting up your project..."
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

# Select project type
echo "Select project type:"
echo ""
echo -e "  ${BLUE}1)${NC} python-backend  - FastAPI/Django, TDD, pytest"
echo -e "  ${BLUE}2)${NC} static-site     - Astro/Next.js, build + visual approval"
echo -e "  ${BLUE}3)${NC} config-infra    - YAML/Terraform, validation + approval"
echo -e "  ${BLUE}4)${NC} base            - Minimal template (customize yourself)"
echo ""
read -p "Enter choice [1-4]: " project_type

case $project_type in
    1) TEMPLATE="python-backend" ;;
    2) TEMPLATE="static-site" ;;
    3) TEMPLATE="config-infra" ;;
    4) TEMPLATE="base" ;;
    *) echo -e "${RED}Invalid choice. Using base template.${NC}"; TEMPLATE="base" ;;
esac

echo ""
echo "Using template: $TEMPLATE"
echo ""

# Create directory structure
echo "Creating directory structure..."
mkdir -p .claude/rules
mkdir -p docs/decisions
mkdir -p docs/ralph

# Download files
if command -v curl &> /dev/null && [ "$1" != "--local" ]; then
    echo "Downloading configuration files..."

    if [ "$TEMPLATE" = "base" ]; then
        # Base template (root level files)
        curl -fsSL "$REPO_URL/CLAUDE.md" -o CLAUDE.md
        curl -fsSL "$REPO_URL/AGENTS.md" -o AGENTS.md
        curl -fsSL "$REPO_URL/PROJECT_CONTEXT.md" -o PROJECT_CONTEXT.md
        curl -fsSL "$REPO_URL/.claudeignore" -o .claudeignore
        curl -fsSL "$REPO_URL/.claude/rules/architecture.md" -o .claude/rules/architecture.md
        curl -fsSL "$REPO_URL/.claude/rules/testing.md" -o .claude/rules/testing.md
    else
        # Project-type template
        curl -fsSL "$REPO_URL/templates/$TEMPLATE/CLAUDE.md" -o CLAUDE.md
        curl -fsSL "$REPO_URL/templates/$TEMPLATE/AGENTS.md" -o AGENTS.md
        curl -fsSL "$REPO_URL/templates/$TEMPLATE/PROJECT_CONTEXT.md" -o PROJECT_CONTEXT.md
        curl -fsSL "$REPO_URL/.claudeignore" -o .claudeignore
        curl -fsSL "$REPO_URL/.claude/rules/architecture.md" -o .claude/rules/architecture.md
        curl -fsSL "$REPO_URL/.claude/rules/testing.md" -o .claude/rules/testing.md

        # Config-infra has golden-rules
        if [ "$TEMPLATE" = "config-infra" ]; then
            curl -fsSL "$REPO_URL/templates/$TEMPLATE/.claude/rules/golden-rules.md" -o .claude/rules/golden-rules.md
        fi
    fi
else
    echo -e "${RED}Error: curl not found. Please copy files manually.${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}✅ Configuration installed! (template: $TEMPLATE)${NC}"
echo ""
echo "Next steps:"
echo "  1. Edit PROJECT_CONTEXT.md with your project details"
echo "  2. Review .claude/rules/ and customize if needed"
echo "  3. Run your first command with Claude Code"
echo ""

# Validate placeholder check
if grep -q "\[PROJECT_NAME\]" PROJECT_CONTEXT.md 2>/dev/null; then
    echo -e "${YELLOW}⚠️  Remember: Edit PROJECT_CONTEXT.md before starting work.${NC}"
    echo "   Claude will remind you if you forget."
fi

echo ""
echo "📚 Documentation: https://github.com/kjosh15/HOW_TO_CODE/tree/main/docs"
echo ""
echo "🎉 Happy building!"
