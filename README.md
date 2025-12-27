# Launchpad

A lean, TDD-focused configuration template for Claude Code and OpenAI Codex.

**~350 lines total. No bloat.**

## What's Included

```
launchpad/
├── CLAUDE.md              # Entry point (imports AGENTS.md)
├── AGENTS.md              # Core process: TDD ratchet, SuperPowers integration
├── PROJECT_CONTEXT.md     # Template for project-specific facts
├── .claude/
│   └── rules/
│       ├── architecture.md
│       └── testing.md
├── .claudeignore          # Keeps token costs low
└── bootstrap.sh           # One-command setup
```

## Quick Start

### Option 0: Auto-Prompt Hook (Recommended)

Add a SessionStart hook so Claude automatically prompts when you start in an unconfigured directory.

**1. Create the hook script** at `~/.claude/hooks/check-launchpad.sh`:

```bash
#!/bin/bash
# Skip home/system directories
if [[ "$PWD" == "$HOME" ]] || [[ "$PWD" == "/" ]] || [[ "$PWD" == /tmp* ]]; then
    exit 0
fi

# Prompt if no config found
if [[ ! -f "AGENTS.md" ]] && [[ ! -f "CLAUDE.md" ]] && [[ ! -f ".claude/CLAUDE.md" ]]; then
    echo "📋 This project isn't configured yet."
    echo "Set up with Launchpad? Run:"
    echo "  curl -fsSL https://raw.githubusercontent.com/kjosh15/launchpad/main/bootstrap.sh | bash"
fi
exit 0
```

**2. Make it executable:** `chmod +x ~/.claude/hooks/check-launchpad.sh`

**3. Add to `~/.claude/settings.json`:**

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "~/.claude/hooks/check-launchpad.sh"
          }
        ]
      }
    ]
  }
}
```

Now Claude will auto-prompt in any unconfigured project directory.

### Option 1: Bootstrap Script (Existing Projects)

```bash
curl -fsSL https://raw.githubusercontent.com/kjosh15/launchpad/main/bootstrap.sh | bash
```

Or download and run:
```bash
./bootstrap.sh
```

### Option 2: GitHub Template (New Projects)

Click "Use this template" on GitHub to create a new repo with this structure.

### Option 3: Manual

Copy the files to your project root and fill in `PROJECT_CONTEXT.md`.

## After Setup

1. **Edit `PROJECT_CONTEXT.md`** with your project's details (commands, ports, stack)
2. **Start coding** - the TDD workflow activates automatically via SuperPowers

## Philosophy

- **Less is more** - Only universal rules, no project-specific noise
- **TDD by default** - Red → Green → Refactor, enforced
- **SuperPowers integration** - Brainstorming, planning, debugging skills built-in
- **Cross-platform** - Works with Claude Code and Codex

## Requirements

- [SuperPowers plugin](https://github.com/obra/superpowers) for full workflow support
- Claude Code or OpenAI Codex

## Customization

- Add project-specific rules to `.claude/rules/`
- Update `PROJECT_CONTEXT.md` as your project evolves
- Use `docs/decisions/` for Architecture Decision Records

## License

MIT
