# Methodology

The workflow philosophy behind LLM-assisted coding.

## Core Workflow

```
PLAN → CHANGE → VERIFY → APPROVE
```

This universal pattern adapts to project type:

| Phase | Code Projects | Content/Config Projects |
|-------|---------------|------------------------|
| **PLAN** | Brainstorm, write spec | Understand requirements |
| **CHANGE** | Write failing test, then code | Make the change |
| **VERIFY** | Tests pass | Build succeeds, looks right |
| **APPROVE** | Commit | User confirms |

## Agent-Native Principles

From [agent-native development](https://every.to/guides/agent-native):

### 1. Parity

Whatever you can do through the UI, the agent should be able to achieve through tools.

**Implication:** Don't restrict agent access without specific safety justification.

### 2. Granularity

Tools should be atomic primitives. Features are outcomes achieved by an agent operating in a loop.

**Implication:** Decision logic belongs in prompts, not bundled into tools.

### 3. Composability

With atomic tools and full parity, new features emerge from prompt-writing alone.

**Implication:** You can describe workflows without coding them.

### 4. Emergent Capability

The agent can accomplish things you didn't explicitly design for.

**Implication:** Observe what users request; patterns reveal latent demand.

### 5. Improvement Over Time

Applications improve through accumulated context files and prompt refinement rather than code deployments alone.

**Implication:** CLAUDE.md and rules evolve; the system learns.

## Spec-First Development

From Thariq (@trq212, Claude Code team):

> "Start with a minimal spec or prompt and ask Claude to interview you using AskUserQuestionTool, then make a new session to execute the spec."

### The Pattern

1. **Start minimal** - Brief description of what you want
2. **Interview phase** - Claude asks clarifying questions
3. **Spec emerges** - Requirements become clear through dialogue
4. **New session** - Execute with clear spec (avoids context pollution)

### Why It Works

- Prevents building the wrong thing
- Questions surface assumptions
- Spec becomes documentation
- Execution session has clean context

## TDD for Code Projects

When the project has testable logic:

```
RED → GREEN → REFACTOR
```

### RED (Write Failing Test)

- Write the test FIRST
- Run it - confirm it FAILS
- Test must fail for the RIGHT reason
- **Never skip this step**

### GREEN (Minimal Implementation)

- Write ONLY enough code to pass the test
- No gold-plating, no "while I'm here" additions
- Run test - confirm it PASSES

### REFACTOR

- Clean up with confidence (tests protect you)
- Remove duplication
- Improve naming
- Keep tests passing

## Skill-Driven Workflow

Use skills at the right moments:

| Situation | Skill | Why |
|-----------|-------|-----|
| New feature idea | `brainstorming` | Refine before committing |
| Ready to implement | `writing-plans` | Break into steps |
| Bug or failure | `systematic-debugging` | Find root cause first |
| Writing code | `test-driven-development` | Enforce RED→GREEN→REFACTOR |
| Completing work | `verification-before-completion` | Evidence before claims |
| Finished feature | `requesting-code-review` | Catch issues early |

### Pre-Implementation Skill Check

Before writing the implementation plan:
1. Extract key capabilities needed from the spec
2. Search installed skills (fast - local grep)
3. If gap found, search configured marketplaces
4. Only propose skills that directly match spec requirements
5. Skip if search takes >30 seconds or yields no strong matches

## Anti-Patterns

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

## Session Discipline

### Starting a Session

1. Read PROJECT_CONTEXT.md for current state
2. Check for any in-progress work
3. Understand before acting

### During a Session

- One task `in_progress` at a time
- Update todos as you complete work
- Document decisions immediately
- Commit after tests pass

### Ending a Session

- Update PROJECT_CONTEXT.md if significant changes
- Ensure todos reflect actual state
- Episodic memory syncs automatically

## Learning Over Time

### How the System Learns

1. **Episodic memory** captures every session
2. **Reflection** (`/reflect`) analyzes patterns
3. **Rules evolve** based on what's learned

### The /reflect Process

Run periodically (not every session):

1. Searches episodic memory for recurring patterns
2. Clusters similar issues/decisions
3. Proposes rule updates with rationale
4. User approves, rejects, or modifies
5. Accepted rules tagged with source:
   ```markdown
   <!-- reflect:2026-01-17 -->
   Always run auth tests before committing login changes.
   ```

### What Good Reflection Looks Like

- **Pattern detected:** "In 4 of last 10 sessions, had to re-run tests after forgetting"
- **Proposed rule:** "Run full test suite before any commit"
- **Rationale:** Prevents repeated context-switch overhead

## Error Recovery

When something goes wrong:

1. **STOP** - Don't compound the error
2. Use `systematic-debugging` skill
3. Find root cause before attempting fixes
4. Add regression test for the bug (if code project)
5. Then fix with confidence

## Communication

- Be direct about blockers and uncertainties
- Ask clarifying questions early, not after building the wrong thing
- Announce which skill you're using and why
- Evidence over assertions

## Measuring Success

How to know the methodology is working:

| Signal | Good | Bad |
|--------|------|-----|
| Rework rate | Decreasing | Staying high |
| "It works" claims | Always verified | Sometimes wrong |
| Rule adoption | Reflection-sourced rules stick | Constant manual fixes |
| Session continuity | Episodic search finds context | Re-explaining repeatedly |
