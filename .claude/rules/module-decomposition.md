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

- Aim for no more than 15 modules; use as few as the problem naturally requires
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
