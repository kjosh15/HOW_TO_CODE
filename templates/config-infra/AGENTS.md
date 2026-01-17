# AGENTS.md - Config/Infrastructure

Core process rules for configuration and infrastructure projects.

## Boot Sequence

1. Read `PROJECT_CONTEXT.md` for system architecture
2. Read `.claude/rules/golden-rules.md` - these are NON-NEGOTIABLE
3. Understand current state before making changes

## Core Process

```
UNDERSTAND → CHANGE → VALIDATE → APPROVE
```

### 1. UNDERSTAND
- Read the golden rules first
- Identify what needs to change
- Check if change affects other components

### 2. CHANGE
- Stay within allowed scope (golden rules define boundaries)
- Make minimal, focused changes
- Preserve existing patterns

### 3. VALIDATE
- Run validation/lint tools
- Dry-run if available
- Check for syntax errors

### 4. APPROVE
- User reviews the change
- User confirms behavior works as expected
- Only then commit/deploy

## Golden Rules

**These are project-specific and NON-NEGOTIABLE.**

See `.claude/rules/golden-rules.md` for this project's constraints.

Common patterns:
- Edit scope restrictions (only modify certain directories)
- Naming conventions (unique IDs, prefixes)
- Files to never modify (UI-managed, generated)
- Secrets handling (use references, never hardcode)

## Verification

For config/infra, "testing" means:
- **Syntax validation** - Config parses without errors
- **Dry-run** - Preview what would change (if supported)
- **User approval** - Confirm behavior is correct after applying

## GitOps Workflow (if applicable)

```
Local edit → Git commit → Push → Pull on target → Validate → Apply
```

Never edit directly on the target system.

## Workflow Skills

| Situation | Skill |
|-----------|-------|
| Planning config changes | `superpowers:writing-plans` |
| Before claiming done | `superpowers:verification-before-completion` |

## Anti-Patterns

- Modifying files outside allowed scope
- Hardcoding secrets
- Making changes without understanding dependencies
- Skipping validation before commit
- Editing directly on production

## Error Recovery

If config breaks something:
1. STOP - don't make more changes
2. Identify what changed (git diff)
3. Rollback if needed
4. Understand the error before fixing
5. Re-apply with fix
