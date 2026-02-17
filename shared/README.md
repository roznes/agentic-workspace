# Agentic Workspace - Quick Context

Universal template for AI-assisted development with Claude Code, Codex CLI, and Gemini CLI.

## This Setup

```
shared/                    # YOU ARE HERE - shared across all agents
├── README.md              # This file - quick context
├── knowledge/             # Persistent memories by topic
│   ├── README.md          # Topic index
│   └── [topic-name]/      # Each topic has its own folder
├── rules/coding-standards.md
├── skills/planner/        # Planning skill
├── skills/reviewer/       # Code review skill
├── hooks/block-secrets.sh # Secret scanning (Claude, Gemini)
└── context/               # User-added context files
```

## Key Behaviors

| User Says | Action |
|-----------|--------|
| "Remember X" | Add to `shared/knowledge/[topic]/` |
| "Plan X" | Use planner skill -> `workspace/outputs/reports/` |
| "Review X" | Use reviewer skill |
| "Clone repo X" | Clone to `workspace/sandbox/repos/<project>/` |
| Provides files | Check `workspace/resources/` |

## Skills

- **planner** - Create implementation plans before coding
- **reviewer** - Code review with checklist

## Code Style

See `rules/coding-standards.md`:
- Readable over clever
- Meaningful names
- Single responsibility
- Comments only where non-obvious
