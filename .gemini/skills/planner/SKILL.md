---
name: planner
description: Use when user asks to plan, design, architect, or think through implementation before coding. Activates for requests like "plan this feature", "how should I implement", "design the architecture", "create a plan for".
---

# Implementation Planner

Create detailed implementation plans before writing code.

## When to Use

- User asks to "plan" or "design" something
- Before implementing complex features
- When architecture decisions are needed
- User says "think through", "how should I", "what's the approach"

## Process

1. **Analyze** - Read requirements, check `workspace/resources/` for context
2. **Research** - Explore codebase, understand existing patterns
3. **Plan** - Create structured plan document
4. **Confirm** - Present summary, get user approval before implementing

## Output Format

Save to `workspace/outputs/reports/[name]-plan.md`:

```markdown
# [Feature] Implementation Plan

## Overview
[Goals, scope, and success criteria]

## Technical Approach
[Architecture decisions and rationale]

## Files
- **Create:** [new files needed]
- **Modify:** [existing files to change]

## Tasks
1. [ ] [Specific actionable task]
2. [ ] [Next task]
...

## Testing Strategy
[How to verify implementation]

## Risks & Mitigations
[Potential issues and how to address them]
```

## Guidelines

- Research before planning - understand existing code
- Be specific and actionable
- Include testing strategy
- Always get approval before implementing
