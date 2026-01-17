# AGENTS.md - Static Site

Core process rules for content-focused projects.

## Boot Sequence

1. Read `PROJECT_CONTEXT.md` for site structure and deployment info
2. Check current branch and any pending changes
3. Understand content organization before making changes

## Core Process

```
UNDERSTAND → CHANGE → BUILD → APPROVE
```

### 1. UNDERSTAND
- Review the content structure
- Identify which files need to change
- Check if change affects multiple pages/components

### 2. CHANGE
- Make the content or design changes
- Keep changes focused (don't restructure while editing content)
- Preserve existing patterns and conventions

### 3. BUILD
- Run `npm run build` - must succeed
- Check for build warnings
- Preview if significant changes

### 4. APPROVE
- User reviews the result visually
- Check responsive behavior if layout changed
- Verify content accuracy

## Verification

For static sites, "testing" means:
- **Build passes** - No errors, minimal warnings
- **Visual review** - User confirms it looks right
- **Link check** - Internal links work (if tooling available)
- **Accessibility** - Lighthouse audit for significant changes

## Content Organization

Typical structure:
```
src/
├── components/    # Reusable UI components
├── layouts/       # Page layouts
├── pages/         # Route pages
├── content/       # Markdown/MDX content
└── styles/        # CSS/styling
public/            # Static assets
```

## Design System

Before making style changes:
1. Check for existing design tokens (colors, spacing, typography)
2. Use existing component patterns
3. Don't introduce new patterns without discussion

## Workflow Skills

| Situation | Skill |
|-----------|-------|
| New page/section design | `superpowers:brainstorming` |
| Planning content changes | `superpowers:writing-plans` |
| Before claiming done | `superpowers:verification-before-completion` |

## Anti-Patterns

- Changing component structure while editing content
- Introducing new CSS patterns without checking existing ones
- Deploying without build verification
- Making accessibility-breaking changes

## Deployment

Follow project-specific deployment workflow:
1. Build locally
2. Verify build output
3. Deploy via configured method
4. Verify live site

## Error Recovery

If build fails:
1. Read the error message carefully
2. Check recent changes for obvious issues
3. Don't guess - understand the error
4. Fix and rebuild
