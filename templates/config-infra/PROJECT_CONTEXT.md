# Project Context

## Identity

[PROJECT_NAME]: [Brief description - e.g., "Home automation config", "Terraform infrastructure"]

## Configuration

| Setting | Value |
|---------|-------|
| Config Format | [YAML / HCL / JSON / etc.] |
| Target System | [Home Assistant / AWS / Kubernetes / etc.] |
| Deployment | [GitOps / manual apply / CI/CD] |

## Key Paths

```
[project-specific structure]
├── [config-dir]/      # Main configuration
├── [secrets-dir]/     # Secret references (not values)
└── docs/              # Documentation
```

## Critical Commands

```bash
# Validation
[command]              # Validate config syntax

# Dry-run (if available)
[command]              # Preview changes

# Apply
[command]              # Apply configuration

# Rollback
[command]              # Revert to previous state
```

## Architecture Notes

### System Overview
[Describe the target system and how this config fits in]

### Key Components
- [Component 1]: [What it does]
- [Component 2]: [What it does]

### Dependencies
- [What depends on what]

## Golden Rules Summary

**Full rules in `.claude/rules/golden-rules.md`**

Key constraints:
1. [Rule 1 - e.g., "Only edit packages/user/ directory"]
2. [Rule 2 - e.g., "All IDs must be prefixed with user_"]
3. [Rule 3 - e.g., "Never modify UI-managed files"]

## Current Status

### Recently Completed
- [Config change with date]

### In Progress
- [Current work]

### Known Issues
- [Config debt or pending changes]

## Secrets Management

- Secrets stored in: [e.g., secrets.yaml, environment variables]
- Reference pattern: [e.g., !secret api_key]
- **Never commit actual secret values**

## Deployment Details

- **Validation:** [How to validate before applying]
- **Apply method:** [GitOps / manual / CI]
- **Rollback:** [How to revert if needed]
- **Target access:** [How to access target system]

---

*Last updated: [DATE]*
