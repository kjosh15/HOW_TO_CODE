# Autonomous Gmail Revenue Review — Setup Guide (Gemini / Claude)

## Purpose
Run a **daily, fully autonomous Gmail analysis** that:
- Reviews all inbound and outbound email from the last 48 hours
- Identifies the **top 3 strategic email follow-ups** and **top 3 meeting-related actions**
- Prioritizes **revenue first**, with visibility and relationship leverage secondary
- Produces a clean, executive-ready summary
- Runs **without manual re-authorization**

This document is written to be used directly as a **Markdown (.md)** system instruction or task specification in **Gemini** or **Claude**.

---

## Why Gemini / Claude (Design Rationale)
This workflow requires:
- Persistent OAuth access to Gmail
- Background execution without user interaction
- Reliable daily scheduling

Gemini and Claude support **long-lived agents with token refresh**, making them suitable for inbox monitoring and autonomous analysis.

---

## Execution Schedule
- **Frequency:** Daily
- **Run Time:** 05:00 GMT (Atlantic/Reykjavik timezone)
- **Window Analyzed:** Last 48 hours (rolling)

---

## Data Sources
- Gmail inbox for account: `josh@josh.is`
- Includes emails sent *to or from* any connected aliases
- Includes calendar-linked email (invites, summaries)

---

## Exclusions (Auto-Ignore)
Exclude threads that are clearly non-actionable:
- Explicit closures: "thanks, all set", "resolved", "no action needed"
- Newsletters
- Receipts and billing confirmations
- Pure FYI messages with no ask
- Automated alerts
- Calendar spam

Borderline threads should be **kept**, not discarded.

---

## Processing Method (MANDATORY)
Follow these steps exactly.

### 1. Collect and Normalize
- Gather all email threads active within the last 48 hours
- Collapse threads into single units
- Deduplicate forwards and replies

### 2. Extract Metadata per Thread
For each retained thread, extract:
- Sender name
- Organization
- Role (if known or inferable)
- Prior relationship context
- Explicit or implicit ask
- Timing sensitivity
- 1–2 trimmed direct quotes (no more)

### 3. Classification
Assign **one primary category**:
- Revenue
- Partnership
- Visibility
- Advisory
- Ops

### 4. Scoring Model (Revenue-Weighted)
Score each thread using the following rubric:

| Factor | Max |
|------|-----|
| Fit | 3 |
| Revenue Impact | 5 |
| Credibility | 3 |
| Urgency | 2 |
| Leverage | 1 |
| Clarity | 2 |
| **Total** | **16** |

### 5. Ranking Logic
- Rank by total score
- Break ties by **immediacy of impact**

### 6. Selection
- Select **Top 3 Email Follow-Ups**
- Select **Top 3 Meeting-Related Actions**

---

## Output Format (STRICT)

### Subject
```
Strategic Follow-Ups — {{LOCAL_DATE}}
```

### META SUMMARY
- **Volume:** <n threads, n meetings>
- **Mix:** <category counts>
- **Trend WTD:** <+/− vs 7-day average>
- **Notables:** <themes, momentum shifts>

---

### TOP 3 EMAIL FOLLOW-UPS

```
1) <Subject> — <Sender, Role, Org> [Category]
Why now: <1–2 sentences>
Quote: "<trimmed quote>"
Score: Fit X, Rev Y, Cred Z, Urg U, Lev L, Clr C, Total T
Suggested action: <one-line action summary>
```

2) ...

3) ...

---

### TOP 3 MEETING ACTIONS

```
1) <Meeting title or thread> — <Counterparty, Org> [Category]
Type: past summary | upcoming prep | invite
Why now: <1–2 sentences>
Quote: "<trimmed quote>"
Score: Fit X, Rev Y, Cred Z, Urg U, Lev L, Clr C, Total T
Suggested action: <one-line action summary>
```

2) ...

3) ...

---

### WATCHLIST (Near-Miss Items)
- <Subject — Sender, one-line rationale>
- <...>
- <...>

---

### COUNTS
- Reviewed: <n>
- Opportunities: <n>
- Included: 6
- Watchlist: <n>

---

## Behavioral Constraints
- Summaries only
- No full email drafts
- Respect thread tone
- No scheduling links unless already present
- No hallucinated emails

---

## Learning & Adaptation
The system should learn over time by observing:
- Emails replied to
- Threads starred
- Threads archived

Adjust scoring implicitly based on observed behavior.

Learning must persist across runs.

---

## Delivery
- Primary output: agent interface (Gemini or Claude)
- Optional: email delivery if supported by platform

---

## Success Criteria
- Zero manual re-authorization
- Consistent daily execution
- Clear revenue-driving prioritization
- No fabricated content

---

## Notes for Implementation
- Use provider-native agent or workflow tools
- Grant durable Gmail read access
- Enable silent token refresh

This document is complete and production-ready.

