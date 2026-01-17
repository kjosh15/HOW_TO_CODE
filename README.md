# HOW_TO_CODE

A unified framework for LLM-assisted coding with Claude Code.

## What This Is

A complete system for effective AI-assisted development:

- **Templates** for different project types (Python backend, static sites, config/infra)
- **Methodology** based on agent-native principles and spec-first development
- **Skills** for reflection and continuous improvement
- **Documentation** explaining how everything fits together

## Quick Start

### For Existing Projects

```bash
curl -fsSL https://raw.githubusercontent.com/kjosh15/HOW_TO_CODE/main/bootstrap.sh | bash
```

The script will ask which template to use:
1. **python-backend** - TDD, pytest, FastAPI/Django
2. **static-site** - Build + visual approval, Astro/Next.js
3. **config-infra** - Validation + approval, YAML/Terraform
4. **base** - Minimal template

### For New Projects

```bash
git clone https://github.com/kjosh15/HOW_TO_CODE my-new-project
cd my-new-project
rm -rf .git && git init
# Choose and copy template from templates/ directory
```

## After Setup

1. Edit `PROJECT_CONTEXT.md` with your project details
2. Review `.claude/rules/` and customize if needed
3. Launch Claude Code and start working

## Structure

```
HOW_TO_CODE/
├── docs/
│   ├── SYSTEM_OVERVIEW.md    # How everything fits together
│   ├── GLOBAL_SETUP.md       # Plugins, skills, hooks, MCP
│   └── METHODOLOGY.md        # Workflow philosophy
├── templates/
│   ├── python-backend/       # TDD-focused Python template
│   ├── static-site/          # Content/design template
│   └── config-infra/         # Config management template
├── skills/
│   ├── reflect/              # Pattern analysis skill
│   └── skill-check/          # Pre-implementation skill search
├── CLAUDE.md                 # Base entry point
├── AGENTS.md                 # Base workflow rules
├── PROJECT_CONTEXT.md        # Base context template
└── bootstrap.sh              # Setup script
```

## Core Concepts

### The Universal Workflow

```
PLAN → CHANGE → VERIFY → APPROVE
```

Verification adapts to project type:
- **Code projects:** Automated tests (TDD)
- **Content/sites:** Build + visual approval
- **Config/infra:** Validation + behavioral approval

### Agent-Native Principles

From [agent-native development](https://every.to/guides/agent-native):

1. **Parity** - Agent can do what you can do
2. **Granularity** - Atomic tools, decisions in prompts
3. **Composability** - Features emerge from prompts
4. **Emergent capability** - Agent can do things you didn't design
5. **Improvement over time** - System learns through context evolution

### Learning Over Time

The `/reflect` skill analyzes episodic memory for patterns and proposes rule updates:
- Only patterns seen 2+ times become rules
- User approves all rule changes
- Rules tagged with source for tracking

## Global Setup

For the full experience, set up the global layer:

1. Install recommended plugins:
   ```
   /plugin marketplace add obra/superpowers-marketplace
   /plugin install superpowers@superpowers-marketplace
   /plugin install episodic-memory@superpowers-marketplace
   ```

2. Copy global config to `~/.claude/`:
   - `CLAUDE.md` (reference to AGENTS.md)
   - `AGENTS.md` (universal workflow rules)

See [docs/GLOBAL_SETUP.md](docs/GLOBAL_SETUP.md) for details.

## Auto-Prompt Hook (Optional)

Add a SessionStart hook so Claude prompts when you start in an unconfigured directory:

**1. Create** `~/.claude/hooks/check-setup.sh`:
```bash
#!/bin/bash
if [[ "$PWD" == "$HOME" ]] || [[ "$PWD" == "/" ]] || [[ "$PWD" == /tmp* ]]; then
    exit 0
fi
if [[ ! -f "AGENTS.md" ]] && [[ ! -f "CLAUDE.md" ]]; then
    echo "📋 This project isn't configured yet."
    echo "Run: curl -fsSL https://raw.githubusercontent.com/kjosh15/HOW_TO_CODE/main/bootstrap.sh | bash"
fi
exit 0
```

**2. Make executable:** `chmod +x ~/.claude/hooks/check-setup.sh`

**3. Add to `~/.claude/settings.json`:**
```json
{
  "hooks": {
    "SessionStart": [{"type": "command", "command": "~/.claude/hooks/check-setup.sh"}]
  }
}
```

## Documentation

- [SYSTEM_OVERVIEW.md](docs/SYSTEM_OVERVIEW.md) - How everything fits together
- [GLOBAL_SETUP.md](docs/GLOBAL_SETUP.md) - Plugins, skills, hooks, MCP servers
- [METHODOLOGY.md](docs/METHODOLOGY.md) - Workflow philosophy and principles

## Requirements

- Claude Code
- [SuperPowers plugin](https://github.com/obra/superpowers-marketplace) for full workflow support
- [Episodic Memory plugin](https://github.com/obra/episodic-memory) for `/reflect` skill

## Contributing

This framework evolves through use. To contribute:

1. Use it and notice patterns
2. Run `/reflect` periodically
3. Propose improvements via PR

## License

MIT
