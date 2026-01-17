# Project Context

## Identity

[PROJECT_NAME]: [Brief description of what this project does]

## Configuration

| Setting | Value |
|---------|-------|
| Port | [e.g., 5433] |
| Database | [e.g., postgres:5433, container name] |
| Language | Python 3.11+ |
| Package Manager | uv |
| Framework | [e.g., FastAPI, Django] |

## Key Paths

```
src/                # Source code
tests/
├── unit/           # Fast, isolated tests
├── integration/    # Tests with real dependencies
└── conftest.py     # Shared fixtures
docs/               # Documentation
```

## Critical Commands

```bash
# Environment
uv sync                          # Install dependencies
uv run alembic upgrade head      # Run migrations

# Development
uv run uvicorn main:app --reload # Dev server (FastAPI)
uv run pytest                    # Run all tests
uv run pytest tests/unit/ -v     # Unit tests verbose

# Quality
uv run ruff check .              # Lint
uv run mypy .                    # Type check
uv run ruff format .             # Format
```

## Architecture Notes

### Stack
- Framework: [FastAPI / Django / Flask]
- Database: PostgreSQL with [SQLAlchemy / Django ORM]
- Testing: pytest with pytest-asyncio

### Key Patterns
- [Pattern 1]: [Brief explanation]
- [Pattern 2]: [Brief explanation]

## Current Status

### Recently Completed
- [Feature/fix with date]

### In Progress
- [Current work]

### Known Issues
- [Technical debt or blockers]

## Environment Variables

Required in `.env`:
```
DATABASE_URL=postgresql://user:pass@localhost:[PORT]/dbname
API_KEY=
```

## External Dependencies

- PostgreSQL: [Container name or how to run]
- Redis: [If applicable]

---

*Last updated: [DATE]*
