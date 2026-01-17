---
name: skill-check
description: Search for relevant skills before implementation. Runs after spec is ready, before planning.
---

# Skill Check

Search for relevant skills that could help with implementation.

## When to Use

**Trigger point:** After spec/PRD is ready, before writing the implementation plan.

```
Brainstorming → Spec → [SKILL CHECK] → Plan → Execute
```

This is a ONE-TIME check per feature, not ongoing.

## Process

### 1. Extract Capabilities from Spec

Read the spec and identify key capabilities needed:
- What technologies are involved?
- What patterns are required?
- What domains does this touch?

Example extraction:
```
Spec: "Add OAuth2 authentication with Google provider"
Capabilities: authentication, OAuth2, Google APIs, session management
```

### 2. Check Installed Skills

Fast local search - check what's already available:

```bash
# List installed skills
ls ~/.claude/skills/
ls .claude/skills/

# Search skill manifests for keywords
grep -r "oauth\|auth" ~/.claude/skills/*/SKILL.md
```

### 3. Search Marketplaces (If Gap Found)

Only if no installed skill matches AND the capability is non-trivial:

```bash
# Search configured marketplace directories
grep -r "[capability]" ~/.claude/plugins/marketplaces/*/
```

**Constraints:**
- Only search configured marketplaces (trusted sources)
- Timeout after 30 seconds
- Skip if no strong match found

### 4. Propose Installation (If Relevant)

If a relevant skill is found in a marketplace:

```markdown
## Skill Found

**Skill:** [name]
**Source:** [marketplace]
**Relevance:** [why it matches the spec]

**What it provides:**
- [capability 1]
- [capability 2]

**Install?** This would help with [specific part of spec].
```

Wait for user approval before installing.

### 5. Proceed with Planning

After skill check completes (installed, declined, or no match):

```markdown
## Skill Check Complete

- Installed skills applicable: [list or "none"]
- New skills installed: [list or "none"]
- Proceeding to implementation planning.
```

## Constraints

- **Speed:** Complete within 30 seconds
- **Scope:** Only configured marketplaces (no web searches)
- **Relevance:** Only propose skills that directly match spec
- **User control:** Always ask before installing

## Integration

This skill is designed to be invoked as part of the planning workflow:

```markdown
# In writing-plans skill or AGENTS.md:

## Pre-Implementation Checklist

1. ✓ Spec is complete and approved
2. → Run skill-check for relevant capabilities
3. □ Create implementation plan
4. □ Execute plan
```

## Example

```
User: Ready to implement the OAuth2 feature from our spec.

Claude: Before planning, let me check for relevant skills.

[Extracts: OAuth2, authentication, Google provider]

Checking installed skills...
- No OAuth2-specific skill installed

Searching marketplaces...
- Found: `oauth-patterns` in superpowers-marketplace
  "Patterns for OAuth2 flows including Google, GitHub, Microsoft"

## Skill Found

**Skill:** oauth-patterns
**Source:** superpowers-marketplace
**Relevance:** Directly covers OAuth2 with Google provider

**What it provides:**
- OAuth2 flow patterns
- Token refresh handling
- Provider-specific gotchas

**Install this skill?**

User: Yes

Claude: Installing oauth-patterns...
Done. Now proceeding to implementation planning with oauth-patterns skill loaded.
```

## When to Skip

Skip skill check if:
- Implementation is trivial (< 30 minutes work)
- Spec uses only well-known patterns you've done before
- User explicitly says to skip
- Previous skill check for same capability was recent
