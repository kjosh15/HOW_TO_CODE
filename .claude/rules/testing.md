# Testing Rules

## Verification is Mandatory

The verification approach adapts to project type:

| Project Type | Verification Method |
|--------------|---------------------|
| Code with logic | Automated tests (RED → GREEN → REFACTOR) |
| Static site/content | Build succeeds + user approves visually |
| Config/Infrastructure | Validation passes + user approves behavior |

**Never claim done without appropriate verification.**

## TDD for Code Projects

```
RED → GREEN → REFACTOR
```

Write the test first, watch it fail, then implement.

## Test Structure

```
tests/
├── unit/           # Fast, isolated tests
├── integration/    # Tests with real dependencies
└── e2e/            # Full system tests (if applicable)
```

## What to Test

### Must Test
- Business logic and calculations
- API endpoints (request/response)
- Error handling paths
- Edge cases and boundaries

### Don't Test
- Third-party library internals
- Framework behavior
- Simple getters/setters
- Private implementation details

## Test Quality

- One assertion focus per test (can have multiple asserts for same behavior)
- Descriptive test names: `test_login_fails_with_invalid_password`
- Arrange-Act-Assert pattern
- No test interdependencies

## Mocking Rules

- Mock at boundaries (external services, I/O)
- Never mock the thing you're testing
- Understand what you're mocking and why
- Prefer fakes/stubs over complex mocks

## Coverage

- Aim for meaningful coverage, not 100%
- Cover critical paths thoroughly
- New features require tests
- Bug fixes require regression tests
