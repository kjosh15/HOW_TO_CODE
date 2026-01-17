# System Overview

How the LLM coding framework fits together.

## The Four Layers

```
┌─────────────────────────────────────────────────────────────┐
│  Layer 1: Global Config (~/.claude)                         │
│  Plugins, skills, hooks, MCP servers                        │
│  → Loads on every Claude Code session                       │
├─────────────────────────────────────────────────────────────┤
│  Layer 2: Project Config (.claude/, CLAUDE.md, AGENTS.md)   │
│  Project-specific rules, commands, context                  │
│  → Extends/overrides global config                          │
├─────────────────────────────────────────────────────────────┤
│  Layer 3: Methodology                                       │
│  Workflow patterns, verification approaches, skill usage    │
│  → Encoded in AGENTS.md and skills                          │
├─────────────────────────────────────────────────────────────┤
│  Layer 4: Automation                                        │
│  Bootstrap scripts, hooks, session management               │
│  → Makes the system self-maintaining                        │
└─────────────────────────────────────────────────────────────┘
```

## How It Works

### Session Start

```
Claude Code launches in any directory
         ↓
Global ~/.claude/CLAUDE.md loads
         ↓
SessionStart hooks fire
         ↓
    ┌────┴────┐
    ↓         ↓
Project has    No project config
CLAUDE.md?
    ↓              ↓
Loads it      Hook prompts: "Set up with bootstrap?"
(extends           ↓
 global)      User approves → bootstrap.sh runs
                   ↓
              Project configured
```

### During a Session

1. **AGENTS.md** defines the workflow (PLAN → CHANGE → VERIFY → APPROVE)
2. **Skills** provide specialized capabilities (brainstorming, debugging, TDD)
3. **Episodic memory** enables recall of past decisions
4. **Hooks** automate routine tasks (git commits, session logging)

### Session End

1. Episodic memory indexes the conversation
2. SessionEnd hooks run (git push, cleanup)
3. Context preserved for next session

## File Hierarchy

```
~/.claude/                          # Global (all projects)
├── CLAUDE.md                       # Entry point → references AGENTS.md
├── AGENTS.md                       # Universal workflow rules
├── settings.json                   # Plugins, hooks, MCP servers
├── skills/                         # Personal skills library
└── plugins/                        # Installed plugins
    └── cache/                      # Plugin versions

/your-project/                      # Project-specific
├── CLAUDE.md                       # Project entry → extends global
├── AGENTS.md                       # Project workflow (optional override)
├── PROJECT_CONTEXT.md              # Project state, config, commands
└── .claude/
    ├── rules/                      # Modular rules
    │   ├── architecture.md
    │   └── testing.md
    └── settings.local.json         # Project-specific permissions
```

## Key Principles

### 1. Progressive Disclosure

Files reference other files with `@` notation:
```markdown
@AGENTS.md
@PROJECT_CONTEXT.md
@.claude/rules/architecture.md
```

This keeps individual files focused while allowing depth when needed.

### 2. Verification Adapts to Project Type

| Project Type | VERIFY means... |
|--------------|-----------------|
| Code with logic | Automated tests pass (RED → GREEN) |
| Static site/content | Build succeeds + user approves |
| Config/Infrastructure | Validation passes + user approves |

### 3. Skills Load On-Demand

Skills activate only when relevant, saving context window:
- Brainstorming skill → when designing features
- TDD skill → when implementing code
- Debugging skill → when investigating issues

### 4. Memory Enables Continuity

Episodic memory preserves:
- Past decisions and their rationale
- Patterns and preferences
- What was tried and rejected

Search with `/search-conversations` or let Claude search when relevant.

### 5. Automation Reduces Friction

Hooks handle routine tasks:
- SessionStart: Check for project setup
- PostToolUse: Auto-commit changes (optional)
- SessionEnd: Sync memory, push changes

## Project Types

The framework supports different project types with appropriate templates:

| Type | Example | Verification | Key Patterns |
|------|---------|--------------|--------------|
| **python-backend** | FastAPI, Django | TDD, pytest | Port isolation, BUGS.md |
| **static-site** | Astro, Next.js | Build + visual approval | Content editing workflow |
| **config-infra** | Home Assistant, Terraform | Validation + approval | Golden rules, GitOps |

See `templates/` for project-type-specific configurations.

## Learning Over Time

The system improves through:

1. **Episodic memory** - Recalls past decisions and patterns
2. **Reflection** - `/reflect` analyzes patterns and proposes rule updates
3. **Rule evolution** - CLAUDE.md grows with learned patterns (tagged with source)

Rules from reflection are tagged:
```markdown
<!-- reflect:2026-01-17 -->
Always run auth tests before committing login changes.
```

## Next Steps

- [GLOBAL_SETUP.md](./GLOBAL_SETUP.md) - How to configure the global layer
- [METHODOLOGY.md](./METHODOLOGY.md) - The workflow philosophy
- [../templates/](../templates/) - Project-type templates
