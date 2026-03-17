# Module Decomposition Design

**Date:** 2026-03-17
**Status:** Approved
**Goal:** Prevent scope creep and code bloat on large projects by decomposing work into modules before implementation.

## Problem

The existing brainstorming → writing-plans workflow works well for small/medium tasks but doesn't enforce structural decomposition for larger work. Without upfront module mapping, projects can accumulate unplanned complexity and exceed intended scope.

## Solution

Add `.claude/rules/module-decomposition.md` — a rule file that Claude applies automatically when complexity thresholds are met.

## Trigger Heuristic

Claude applies module decomposition during brainstorming when **any** of these are true:
- Greenfield project (new repo or new top-level feature)
- Estimated >3 new files to be created
- Estimated >300 LOC
- Work spans multiple distinct responsibilities (layers, services, subsystems)

Does **not** apply to: bugfixes, single endpoints, config changes, small additions to existing code.

## Decomposition Output

Before writing the design doc, Claude produces a module map:

| Module | Interfaces (inputs/outputs) | Est. LOC | Independent? |
|--------|----------------------------|----------|--------------|
| ...    | ...                        | ~NNN     | yes/no       |

- Target 5–15 modules
- Module map is a section in the design doc
- User approves the module map before Claude proceeds to the rest of the design

## Sequential Review Gates

When `writing-plans` runs after a decomposition-triggered brainstorm:
- Plans one module at a time
- Each plan ends with: "Module N complete. Review, then say 'next' to plan Module N+1."
- Claude does not proceed until explicitly told to
- Each module = one top-level TodoWrite item; sub-tasks only created for the current module

## Integration Points

| Existing Tool | Change |
|---------------|--------|
| `superpowers:brainstorming` | Complexity check added; triggers module map step |
| `superpowers:writing-plans` | Scoped to one module at a time when decomposition was done |
| TodoWrite | Module-per-todo structure; only current module gets sub-tasks |
| Design doc | Gains "Module Map" section |

## Files to Create/Modify

1. **Create** `.claude/rules/module-decomposition.md` — rule definition
2. **Modify** `AGENTS.md` — reference the new rule under workflow guidance
