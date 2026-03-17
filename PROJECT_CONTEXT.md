# Project Context

## Identity

**HOW_TO_CODE**: Methodology, rules, and workflow documentation for LLM-assisted software development using Claude Code.

## Configuration

| Setting | Value |
|---------|-------|
| Type | Documentation / config repo (no runtime) |
| Language | Markdown |
| Package Manager | None |

## Key Paths

```
docs/                   # Methodology, system overview, plans
  METHODOLOGY.md        # Workflow philosophy and patterns
  SYSTEM_OVERVIEW.md    # How the four-layer framework fits together
  GLOBAL_SETUP.md       # How to configure the global layer
  plans/                # Design docs and implementation plans
.claude/
  rules/                # Modular rules loaded via @ directives
    architecture.md
    testing.md
    module-decomposition.md
AGENTS.md               # Core agent process rules
CLAUDE.md               # Entry point, loads AGENTS.md + rules
PROJECT_CONTEXT.md      # This file
```

## Commands

```bash
# No build or test commands — this is a documentation repo.

# Security
snyk code test          # Static analysis (if scripts are added)
```

## Architecture

### Stack
- Format: Markdown
- Loaded by: Claude Code via `@` directives in CLAUDE.md
- Rules location: `.claude/rules/`
- Docs location: `docs/`

### Key Patterns
- **Progressive disclosure**: CLAUDE.md → AGENTS.md → `.claude/rules/*.md`
- **Rule files**: Modular, single-purpose, loaded on every session
- **Design docs**: Saved to `docs/plans/YYYY-MM-DD-*.md` per feature

## Current Status

### Recently Completed
- Module decomposition workflow (2026-03-17): automatic scope control for large/greenfield projects

### In Progress
- None

### Known Issues
- None

## Environment Variables

None required.

---

*Last updated: 2026-03-17*
