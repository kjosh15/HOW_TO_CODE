# Module Decomposition Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a module decomposition rule that automatically triggers during brainstorming for large/greenfield work, producing a module map and enforcing sequential review gates.

**Architecture:** A new rule file defines the trigger heuristic, decomposition template, and gate behavior. AGENTS.md is updated to reference it so Claude loads the rule automatically.

**Tech Stack:** Markdown rule files, existing CLAUDE.md/AGENTS.md convention

---

### Task 1: Create `.claude/rules/module-decomposition.md`

**Files:**
- Create: `.claude/rules/module-decomposition.md`

**Step 1: Create the rule file**

```markdown
# Module Decomposition

## When to Apply

Apply module decomposition during `superpowers:brainstorming` when **any** of the
following are true:

- Greenfield project (new repo or new top-level feature)
- Estimated >3 new files to be created
- Estimated >300 LOC
- Work spans multiple distinct responsibilities (layers, services, subsystems)

**Skip for:** bugfixes, single endpoints, config changes, small additions to
existing code.

## Step: Produce a Module Map

Before writing the design doc, output a module map and get user approval:

| Module | Interfaces (inputs/outputs) | Est. LOC | Independent? |
|--------|-----------------------------|----------|--------------|
| ...    | ...                         | ~NNN     | yes/no       |

- Aim for 5–15 modules
- "Independent?" = can be built without any other module being done first
- Include this table as a "Module Map" section in the design doc
- **Do not proceed to the rest of the design until the user approves the module map**

## Sequential Review Gates (writing-plans)

When `superpowers:writing-plans` runs after a decomposition-triggered brainstorm:

1. Plan **one module at a time** — do not plan all modules upfront
2. End each plan with: "Module N complete. Review, then say 'next' to plan Module N+1."
3. Do not proceed to the next module until explicitly told to
4. In TodoWrite: each module = one top-level todo item; only create sub-tasks for
   the **current** module

## Primary Goal

Prevent scope creep and code bloat. When in doubt about whether a module belongs
in scope, default to **excluding it** and flagging it as a possible future addition.
```

**Step 2: Verify the file exists**

```bash
cat .claude/rules/module-decomposition.md
```

Expected: file contents print without error.

**Step 3: Commit**

```bash
git add .claude/rules/module-decomposition.md
git commit -m "feat: add module-decomposition rule for scope control"
```

---

### Task 2: Update `AGENTS.md` to reference the new rule

**Files:**
- Modify: `AGENTS.md` (PLAN section, around line 21-25)

**Step 1: Add module decomposition to the PLAN phase**

In the `### 1. PLAN` section, add a bullet after "Use brainstorming for non-trivial features":

```markdown
- For large/greenfield work, apply module decomposition (see `.claude/rules/module-decomposition.md`)
```

**Step 2: Verify AGENTS.md reads correctly**

```bash
grep -A6 "### 1. PLAN" AGENTS.md
```

Expected output includes the new bullet.

**Step 3: Commit**

```bash
git add AGENTS.md
git commit -m "docs: reference module-decomposition rule in PLAN phase"
```

---

### Task 3: Add to METHODOLOGY.md

**Files:**
- Modify: `docs/METHODOLOGY.md` (after the Spec-First Development section)

**Step 1: Add a Module Decomposition section**

After the "Spec-First Development" section (around line 66), add:

```markdown
## Module Decomposition (Large Projects)

From the [module-decomposition rule](.claude/rules/module-decomposition.md):

When scope is large (>3 files, >300 LOC, or greenfield), decompose before designing:

1. **Map modules** — name each component, its interfaces, estimated size, and independence
2. **Approve the map** — user reviews before design proceeds
3. **Build sequentially** — one module at a time, with explicit review gates between each

**Primary goal:** Prevent scope creep. When in doubt, exclude and flag for later.
```

**Step 2: Commit**

```bash
git add docs/METHODOLOGY.md
git commit -m "docs: document module decomposition workflow in METHODOLOGY.md"
```
