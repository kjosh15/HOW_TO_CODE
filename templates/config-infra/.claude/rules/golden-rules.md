# Golden Rules

**These rules are NON-NEGOTIABLE. Violating them can break the system.**

## Edit Scope

1. **Only modify:** [specify allowed directories/files]
2. **Never modify:** [specify forbidden directories/files]
3. **Read-only:** [specify directories that can be read but not written]

## Naming Conventions

1. **All IDs must:** [specify ID pattern - e.g., "be prefixed with user_"]
2. **File names:** [specify naming pattern]
3. **No duplicates:** [specify uniqueness requirements]

## Forbidden Actions

1. [Action 1 - e.g., "Never edit automations.yaml directly (UI-managed)"]
2. [Action 2 - e.g., "Never hardcode secrets in config files"]
3. [Action 3 - e.g., "Never delete without understanding dependencies"]

## Required Practices

1. [Practice 1 - e.g., "Always validate syntax before committing"]
2. [Practice 2 - e.g., "Document non-obvious configuration choices"]
3. [Practice 3 - e.g., "Test changes in isolation when possible"]

## Secret Handling

- Use secret references: [pattern - e.g., "!secret key_name"]
- Never commit: [what not to commit]
- Secrets file location: [where secrets are defined]

---

**If unsure about a rule, ASK before proceeding.**
