# Architecture Rules

## Code Organization

- Keep modules focused and single-purpose
- Prefer composition over inheritance
- Dependencies flow inward (domain has no external dependencies)

## Naming Conventions

- Files: `snake_case.py` or `kebab-case.ts`
- Classes: `PascalCase`
- Functions/variables: `snake_case` (Python) or `camelCase` (JS/TS)
- Constants: `UPPER_SNAKE_CASE`

## Error Handling

- Fail fast at system boundaries
- Use typed errors/exceptions where possible
- Log with context (what operation, what input caused failure)
- Don't swallow errors silently

## API Design

- Consistent naming across endpoints
- Validate inputs at boundaries
- Return structured error responses
- Document breaking changes

## Database

- Migrations for all schema changes
- Never modify data in migrations (separate data migrations)
- Index frequently queried columns
- Use transactions for multi-step operations
