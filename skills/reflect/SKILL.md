---
name: reflect
description: Analyze episodic memory for patterns and propose rule updates to CLAUDE.md
---

# Reflect Skill

Analyze conversation history to identify recurring patterns and propose rule updates.

## When to Use

- After 5-10 sessions (not every session)
- When you notice repeating issues
- Periodically for system improvement

## Process

### 1. Search Episodic Memory

Search for patterns in recent conversations:

```
/search-conversations [recurring issues, mistakes, corrections]
```

Use date bounds to focus on recent sessions (last 2-4 weeks):
- Search for: errors, corrections, "should have", "forgot to", "next time"
- Look for: repeated explanations, recurring decisions, consistent preferences

### 2. Identify Patterns

Group findings into categories:

| Category | Example |
|----------|---------|
| **Repeated mistakes** | "Forgot to run tests before commit" (3 occurrences) |
| **Consistent preferences** | "User prefers X over Y" (seen in 5 sessions) |
| **Recurring decisions** | "Always chose approach A for problem type B" |
| **Corrections received** | "User corrected me about X" (2+ times) |

**Threshold:** Only propose rules for patterns seen 2+ times.

### 3. Draft Rule Proposals

For each pattern, draft a concise rule:

```markdown
**Pattern:** [What was observed]
**Frequency:** [How often, in how many sessions]
**Proposed rule:** [The rule to add]
**Rationale:** [Why this helps]
```

### 4. Present to User

Present proposals one at a time:

```markdown
## Reflection Finding #1

**Pattern observed:** In 3 of the last 8 sessions, tests failed after commit because auth tests weren't run.

**Proposed rule:**
> Always run auth-related tests (`pytest tests/auth/`) before committing changes to authentication code.

**Add this rule to CLAUDE.md?**
```

Wait for user approval before proceeding to next proposal.

### 5. Apply Approved Rules

For approved rules, add to the appropriate location:

**Global rules** → `~/.claude/CLAUDE.md`
**Project rules** → `./CLAUDE.md` or `.claude/rules/`

Tag with reflection source:
```markdown
<!-- reflect:YYYY-MM-DD -->
[The rule text]
```

## Output Format

After completing reflection:

```markdown
## Reflection Summary

**Sessions analyzed:** [date range]
**Patterns found:** [count]
**Rules proposed:** [count]
**Rules accepted:** [count]

### Accepted Rules
1. [Rule 1] → added to [location]
2. [Rule 2] → added to [location]

### Rejected/Deferred
- [Rule 3]: [reason for rejection]
```

## Constraints

- **Don't over-propose** - Only patterns with 2+ occurrences
- **Be specific** - Vague rules don't help
- **Respect scope** - Global vs project rules
- **User decides** - Never auto-add rules

## Example Session

```
User: /reflect

Claude: I'll analyze recent conversations for patterns.

[Searches episodic memory for last 3 weeks]
[Identifies 3 potential patterns]

## Reflection Finding #1

**Pattern observed:** In 4 sessions, I proposed code changes without reading the file first. User corrected me each time.

**Proposed rule:**
> Never propose changes to code you haven't read. Always use Read tool before suggesting modifications.

**Add this rule to ~/.claude/CLAUDE.md?**

User: Yes

Claude: Added to ~/.claude/CLAUDE.md with reflection tag.

## Reflection Finding #2
...
```

## Integration with Episodic Memory

This skill requires the `episodic-memory` plugin:

```bash
/plugin install episodic-memory@superpowers-marketplace
```

The skill uses:
- `episodic_memory_search` - Find relevant conversations
- `episodic_memory_show` - Read full conversation context

## Frequency

**Recommended:** Run `/reflect` every 1-2 weeks, or after:
- A frustrating session with repeated corrections
- Completing a major project phase
- Noticing a pattern yourself
