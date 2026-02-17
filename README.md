# Agentic Workspace

Template for AI-assisted development workflows.

## Structure

```
agentic-workspace/
├── CLAUDE.md                 # Claude Code instructions
├── AGENTS.md                 # Codex CLI instructions
├── GEMINI.md                 # Gemini CLI instructions
│
├── shared/                   # Shared across all agents
│   ├── README.md             # Quick context for AI
│   ├── context/              # User-added context files
│   ├── knowledge/            # Memories by topic (say "remember")
│   ├── rules/                # Coding standards
│   └── skills/               # planner, reviewer
│
├── .claude/                  # Claude settings
├── .gemini/                  # Gemini settings
│
├── docs/
│   ├── guides/               # Setup, skills, usage
│   └── templates/            # Project & skill templates
│
└── workspace/                # Local work (gitignored)
    ├── resources/            # Input: docs, images, data
    │   ├── docs/             # Reference documents
    │   ├── images/           # Screenshots, diagrams
    │   └── data/             # Data files (JSON, CSV)
    ├── outputs/              # Generated code, reports
    │   ├── generated/        # AI-generated code
    │   ├── reports/          # Generated reports
    │   └── exports/          # Exported files
    ├── sandbox/              # Experiments & repos
    │   ├── repos/            # Cloned repos for AI review
    │   ├── experiments/      # Code experiments
    │   └── test-data/        # Test data
    └── temp/                 # Session scratch files
```

## Quick Start

```bash
git clone <this-repo> my-project
cd my-project
claude                        # or: codex, gemini
```

## Skills

Built-in: `planner`, `reviewer`

Browse [skills.sh](https://skills.sh) for your stack:

```bash
npx skills add <owner>/<skill-name>
```

Popular skills:
- `vercel-labs/agent-skills` — React, web design
- `anthropics/skills` — Frontend, skill creator

## Workflow

```
1. Add context    →  workspace/resources/
2. Ask AI        →  "Plan feature X" or "Review this code"
3. Get output    →  workspace/outputs/
```

## Docs

- [Setup Guide](docs/guides/agents.md)
- [Skills Guide](docs/guides/skills.md)
- [Usage Examples](docs/guides/usage-examples.md)

## License

[MIT](LICENSE)
