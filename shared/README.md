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
├── hooks/block-secrets.sh # Secret scanning (used by all agents)
└── context/               # User-added context files

workspace/                 # Local work area (gitignored content)
├── resources/             # INPUT: docs, images, data
├── outputs/               # OUTPUT: generated code, reports
├── sandbox/               # Experiments & repos
└── temp/                  # Session scratch files
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

## Workspace Paths

| Input | Output |
|-------|--------|
| `workspace/resources/docs/` | `workspace/outputs/generated/` |
| `workspace/resources/images/` | `workspace/outputs/reports/` |
| `workspace/resources/data/` | `workspace/outputs/exports/` |

## Code Style

See `rules/coding-standards.md`:
- Readable over clever
- Meaningful names
- Single responsibility
- Comments only where non-obvious
