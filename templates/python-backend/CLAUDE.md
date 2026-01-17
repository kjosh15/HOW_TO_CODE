# CLAUDE.md

## Core Process

@AGENTS.md

## Project Context

@PROJECT_CONTEXT.md

## Commands

```bash
# Development
uv run pytest                    # Run tests
uv run pytest -x                 # Stop on first failure
uv run pytest tests/unit/        # Unit tests only
uv run python -m [module]        # Run module

# Quality
uv run ruff check .              # Lint
uv run ruff format .             # Format
uv run mypy .                    # Type check

# Database (if applicable)
uv run alembic upgrade head      # Run migrations
uv run alembic revision -m "..." # Create migration
```

## Quick Reference

- **Before coding**: Use brainstorming skill to refine design
- **During coding**: Follow TDD (RED → GREEN → REFACTOR)
- **After coding**: Run full test suite, verify before completion
- **Commits**: Reference task context

## Rules

@.claude/rules/architecture.md
@.claude/rules/testing.md
