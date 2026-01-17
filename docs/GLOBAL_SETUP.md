# Global Setup

How to configure the global Claude Code layer (~/.claude).

## Core Files

### ~/.claude/CLAUDE.md

Minimal entry point that loads on every session:

```markdown
# Global Claude Code Config

@~/.claude/AGENTS.md
```

### ~/.claude/AGENTS.md

Universal workflow rules. See [METHODOLOGY.md](./METHODOLOGY.md) for the philosophy.

Key sections:
- Boot sequence (what to check at session start)
- Core workflow (PLAN → CHANGE → VERIFY → APPROVE)
- Skill mapping (when to use which skills)
- Anti-patterns to avoid

## Plugins

### Recommended Plugins

| Plugin | Purpose | Install |
|--------|---------|---------|
| **superpowers** | TDD, debugging, planning skills | `/plugin install superpowers@superpowers-marketplace` |
| **episodic-memory** | Conversation search and recall | `/plugin install episodic-memory@superpowers-marketplace` |

### Installing Plugins

```bash
# Add a marketplace
/plugin marketplace add obra/superpowers-marketplace

# Install from marketplace
/plugin install superpowers@superpowers-marketplace

# List installed plugins
/plugin list
```

### Marketplaces

Configured marketplaces are stored in `~/.claude/plugins/marketplaces/`.

**Recommended marketplaces:**
- `obra/superpowers-marketplace` - High-quality workflow skills
- `anthropics/skills` - Anthropic's official reference skills

## Skills

### How Skills Work

Skills are folders containing instructions that Claude loads on-demand:
- `~/.claude/skills/` - Personal skills (all projects)
- `.claude/skills/` - Project-specific skills

### Key Skills from Superpowers

| Skill | When to Use |
|-------|-------------|
| `brainstorming` | Before designing new features |
| `test-driven-development` | When implementing code |
| `systematic-debugging` | When investigating bugs |
| `writing-plans` | When planning implementation |
| `executing-plans` | When following a plan |
| `verification-before-completion` | Before claiming done |
| `requesting-code-review` | After significant code changes |

### Searching for New Skills

Before implementing something novel:
1. Check installed skills: `/skills`
2. Search marketplaces: grep skill manifests in marketplace directories
3. If relevant skill found, propose installation to user
4. Only proceed without skill if none exists or user declines

## Hooks

### Hook Types

| Hook | When It Fires |
|------|---------------|
| `SessionStart` | Claude Code launches |
| `SessionEnd` | Session closes |
| `PostToolUse` | After specific tools run |
| `PreCompact` | Before context compaction |

### Recommended Hooks

**SessionStart - Project Setup Check:**
```json
{
  "SessionStart": [
    {
      "type": "command",
      "command": "~/.claude/hooks/check-setup.sh"
    }
  ]
}
```

**SessionEnd - Memory Sync:**
```json
{
  "SessionEnd": [
    {
      "type": "command",
      "command": "episodic-memory sync"
    }
  ]
}
```

### Hook Scripts Location

Store hook scripts in `~/.claude/hooks/`:
```
~/.claude/hooks/
├── check-setup.sh      # Prompts for project setup if missing
├── session-end.sh      # Cleanup and sync
└── ...
```

## MCP Servers

### What MCP Provides

Model Context Protocol servers expose tools to Claude:
- Database queries
- File operations
- External API access
- Custom capabilities

### Configured MCP Servers

MCP servers are defined in `~/.claude/settings.json` or `.mcp.json`:

```json
{
  "mcpServers": {
    "episodic-memory": {
      "command": "node",
      "args": ["path/to/mcp-server.js"]
    }
  }
}
```

### From Plugins

Plugins can provide MCP servers automatically. The episodic-memory plugin provides:
- `episodic_memory_search` - Semantic search of past conversations
- `episodic_memory_show` - Display a conversation

## Settings Structure

### ~/.claude/settings.json

Main configuration file:

```json
{
  "model": "opus",
  "plugins": {
    "enabled": ["superpowers", "episodic-memory"]
  },
  "hooks": {
    "SessionStart": [...],
    "SessionEnd": [...]
  },
  "mcpServers": {...}
}
```

### ~/.claude/settings.local.json

Local overrides (not committed to git):

```json
{
  "permissions": {
    "allow": [
      {"tool": "WebFetch", "domain": "github.com"},
      {"tool": "Bash", "command": "npm test"}
    ]
  }
}
```

## Replicating This Setup

To replicate on a new machine:

1. **Install Claude Code**

2. **Create global config:**
   ```bash
   mkdir -p ~/.claude/hooks
   # Copy CLAUDE.md and AGENTS.md from this repo
   ```

3. **Add marketplaces:**
   ```
   /plugin marketplace add obra/superpowers-marketplace
   /plugin marketplace add anthropics/skills
   ```

4. **Install plugins:**
   ```
   /plugin install superpowers@superpowers-marketplace
   /plugin install episodic-memory@superpowers-marketplace
   ```

5. **Configure hooks** in settings.json

6. **Test:** Launch Claude Code in any directory and verify setup prompt appears

## Maintenance

### Updating Plugins

```
/plugin update superpowers
```

### Checking Plugin Health

```
/plugin list
```

### Clearing Cache

```bash
rm -rf ~/.claude/plugins/cache/*
```

## Troubleshooting

### Hooks Not Firing

- Check settings.json syntax
- Verify hook scripts are executable (`chmod +x`)
- Check script paths are absolute

### Skills Not Loading

- Verify skill folder structure (needs SKILL.md or manifest)
- Check skill is in correct location
- Try `/skills` to list available skills

### MCP Server Issues

- Check server process is running
- Verify command path is correct
- Check server logs for errors
