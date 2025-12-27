# AGENTS.md

Core process rules for AI coding agents (Claude Code, Codex, etc.).

## Boot Sequence

1. **Read context**: Load `PROJECT_CONTEXT.md` for project-specific facts
2. **Validate setup**: Check for placeholder text like `[PROJECT_NAME]` or `[TODO]`
   - If found: Stop and ask user to configure PROJECT_CONTEXT.md first
3. **Check environment**: Verify .env exists if project requires it
4. **Review active work**: Check TodoWrite for in-progress tasks

## Core Process: TDD Ratchet

All implementation follows the TDD ratchet - no exceptions:

```
PLAN → RED → GREEN → REFACTOR → VERIFY
```

### 1. PLAN
- Understand requirements before coding
- Use brainstorming for non-trivial features
- Break complex work into small, testable increments
- Create TodoWrite items for tracking

### 2. RED (Write Failing Test)
- Write the test FIRST
- Run it - confirm it FAILS
- Test must fail for the RIGHT reason
- Never skip this step

### 3. GREEN (Minimal Implementation)
- Write ONLY enough code to pass the test
- No gold-plating, no "while I'm here" additions
- Run test - confirm it PASSES

### 4. REFACTOR
- Clean up with confidence (tests protect you)
- Remove duplication
- Improve naming
- Keep tests passing

### 5. VERIFY
- Run full test suite before claiming completion
- Check linting/type errors
- Run security scan: `snyk test` (dependencies) or `snyk code test` (static analysis)
- Evidence before assertions - never claim "fixed" without proof

## Workflow Skills

Use these SuperPowers skills at appropriate moments:

| Situation | Skill |
|-----------|-------|
| New feature/design | `superpowers:brainstorming` |
| Planning implementation | `superpowers:writing-plans` |
| Executing a plan | `superpowers:execute-plan` |
| Any implementation | `superpowers:test-driven-development` |
| Bug investigation | `superpowers:systematic-debugging` |
| Before completion | `superpowers:verification-before-completion` |
| After significant code | `superpowers:requesting-code-review` |
| Receiving feedback | `superpowers:receiving-code-review` |

## Anti-Patterns to Avoid

### Testing Anti-Patterns
- Testing mock behavior instead of real behavior
- Adding test-only methods to production code
- Mocking without understanding what you're mocking
- Skipping the RED phase ("I know this will work")

### Implementation Anti-Patterns
- Coding before understanding requirements
- "Fixing" code you haven't read
- Over-engineering beyond current needs
- Claiming completion without running verification

### Process Anti-Patterns
- Skipping brainstorming for "simple" features
- Batch-completing todos instead of one at a time
- Rationalizing why a skill doesn't apply
- Proposing changes to code you haven't read

## Decision Documentation

For significant architectural decisions:
1. Create `docs/decisions/NNNN-title.md`
2. Document context, options considered, decision, consequences
3. Reference in commits and PROJECT_CONTEXT.md

## Session Discipline

### Starting a Session
- Review PROJECT_CONTEXT.md for current state
- Check for any in-progress work
- Understand before acting

### During a Session
- One task in_progress at a time
- Update todos as you complete work
- Document decisions immediately
- Commit after tests pass

### Ending a Session
- Update PROJECT_CONTEXT.md if significant changes
- Ensure todos reflect actual state
- Update CHANGELOG.md for completed features

## Error Recovery

When something goes wrong:
1. STOP - don't compound the error
2. Use `superpowers:systematic-debugging`
3. Find root cause before attempting fixes
4. Add regression test for the bug
5. Then fix with confidence

## Communication

- Be direct about blockers and uncertainties
- Ask clarifying questions early, not after building the wrong thing
- Announce which skill you're using and why
- Evidence over assertions
