# Instructions for Claude Code / Codex

**Copy this entire file to your AI assistant when starting a new project.**

---

## What is Launchpad?

Launchpad is a lean, TDD-focused configuration template for AI coding agents. It provides:

- **AGENTS.md** - Core process rules (TDD ratchet, SuperPowers integration)
- **PROJECT_CONTEXT.md** - Template for project-specific facts
- **Progressive disclosure** - Architecture and testing rules in `.claude/rules/`
- **~380 lines total** - No bloat, low token cost

---

## Setup Instructions

### Option 1: New Project (Use as Template)

```bash
# Clone launchpad
git clone https://github.com/jxnl/launchpad my-project-name
cd my-project-name

# Reset git history for fresh start
rm -rf .git
git init
git add -A
git commit -m "Initial commit from launchpad template"
```

### Option 2: Existing Project (Bootstrap)

```bash
cd /path/to/existing/project

# Run bootstrap script
curl -fsSL https://raw.githubusercontent.com/jxnl/launchpad/main/bootstrap.sh | bash
```

### Option 3: Manual Copy

Download these files to your project root:
- `CLAUDE.md`
- `AGENTS.md`
- `PROJECT_CONTEXT.md`
- `.claudeignore`
- `.claude/rules/architecture.md`
- `.claude/rules/testing.md`

---

## After Setup

1. **Edit `PROJECT_CONTEXT.md`** - Fill in your project's commands, ports, and stack
2. **Start coding** - The TDD workflow activates automatically

The agent will refuse to proceed if `PROJECT_CONTEXT.md` still has `[TODO]` placeholders.

---

## Requirements

- [SuperPowers plugin](https://github.com/obra/superpowers) for full workflow support
- Claude Code or OpenAI Codex

---

## The Workflow

Once configured, the agent follows this process:

```
PLAN → RED → GREEN → REFACTOR → VERIFY
```

- **Before coding**: Brainstorming skill refines design
- **During coding**: TDD enforced (test first, then implement)
- **After coding**: Code review + verification before claiming done

---

**Repository:** https://github.com/jxnl/launchpad
