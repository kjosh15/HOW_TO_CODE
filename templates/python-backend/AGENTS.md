# AGENTS.md - Python Backend

Core process rules for AI coding agents.

## Boot Sequence

1. Read `PROJECT_CONTEXT.md` for project-specific facts
2. Verify DATABASE_URL port matches project (avoid cross-project contamination)
3. Check for any in-progress work or bugs

## Core Process: TDD Ratchet

All implementation follows TDD - no exceptions:

```
PLAN → RED → GREEN → REFACTOR → VERIFY
```

### 1. PLAN
- Understand requirements before coding
- Use brainstorming skill for non-trivial features
- Check for relevant skills before implementing

### 2. RED (Write Failing Test)
- Write the test FIRST
- Run it - confirm it FAILS
- Test must fail for the RIGHT reason
- **Never skip this step**

### 3. GREEN (Minimal Implementation)
- Write ONLY enough code to pass the test
- No gold-plating, no "while I'm here" additions
- Run test - confirm it PASSES

### 4. REFACTOR
- Clean up with confidence (tests protect you)
- Remove duplication, improve naming
- Keep tests passing

### 5. VERIFY
- Run full test suite before claiming completion
- Check linting/type errors
- Evidence before assertions

## Port Discipline

**CRITICAL:** Check DATABASE_URL port before any database operations.

Different projects use different ports to prevent cross-contamination:
- Verify port matches PROJECT_CONTEXT.md
- Never assume default port (5432)
- If port mismatch, STOP and ask user

## Workflow Skills

| Situation | Skill |
|-----------|-------|
| New feature/design | `superpowers:brainstorming` |
| Planning implementation | `superpowers:writing-plans` |
| Any code implementation | `superpowers:test-driven-development` |
| Bug investigation | `superpowers:systematic-debugging` |
| Before claiming done | `superpowers:verification-before-completion` |
| After significant code | `superpowers:requesting-code-review` |

## Anti-Patterns

### Testing
- Testing mock behavior instead of real behavior
- Mocking without understanding what you're mocking
- Skipping the RED phase

### Implementation
- Coding before understanding requirements
- "Fixing" code you haven't read
- Over-engineering beyond current needs

### Process
- Batch-completing todos
- Claiming completion without running tests
- Proposing changes to code you haven't read

## Error Recovery

1. STOP - don't compound the error
2. Use `systematic-debugging` skill
3. Find root cause before attempting fixes
4. Add regression test for the bug
5. Then fix with confidence
