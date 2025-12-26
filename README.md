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

### Option 1: Bootstrap Script (Existing Projects)

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USER/launchpad/main/bootstrap.sh | bash
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
