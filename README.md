# Agentic Workspace

Template for AI-assisted development workflows.

## Structure

```
agentic-workspace/
├── CLAUDE.md                 # Claude Code instructions
├── AGENTS.md                 # Codex CLI instructions
├── GEMINI.md                 # Gemini CLI instructions
├── agent.config.example.toml # Agent config template (cp → agent.config.toml)
├── .claude/                  # Claude Code config
│   ├── settings.json         # Permissions, hooks
│   └── skills/               # planner, reviewer
│
├── .codex/                   # Codex CLI config
│   ├── config.toml           # Sandbox, approval, model settings
│   └── prompts/              # Codex reusable prompts/commands
│
├── .agents/                  # Codex Skills (official SKILL.md location)
│   └── skills/               # planner, reviewer
│
├── .gemini/                  # Gemini CLI config
│   ├── settings.json         # Tools, sandbox, security, hooks
│   └── skills/               # planner, reviewer
│
├── shared/                   # Shared across all agents
│   ├── README.md             # Quick context for AI
│   ├── context/              # User-added context files
│   ├── knowledge/            # Memories by topic (say "remember")
│   ├── rules/                # Coding standards
│   ├── skills/               # planner, reviewer
│   └── hooks/                # Secret scanning script
│
├── docs/
│   ├── guides/               # Setup, skills, usage
│   └── templates/            # Project & skill templates
│
└── workspace/                # Local work (gitignored)
    ├── resources/            # Input: docs, images, data
    ├── outputs/              # Generated code, reports
    ├── sandbox/              # Experiments & repos
    └── temp/                 # Session scratch files
```

## Quick Start

```bash
git clone <this-repo> my-project
cd my-project
cp agent.config.example.toml agent.config.toml
claude                        # or: codex, gemini
```

## Agent Configuration

| Agent | Instructions | Config | Skills / Prompts |
|-------|-------------|--------|------------------|
| Claude Code | `CLAUDE.md` | `.claude/settings.json` | `.claude/skills/` |
| Codex CLI | `AGENTS.md` | `.codex/config.toml` | `.agents/skills/` + `.codex/prompts/` |
| Gemini CLI | `GEMINI.md` | `.gemini/settings.json` | `.gemini/skills/` |

All agents share `shared/rules/`, `shared/skills/`, and `shared/hooks/`.

## Skills

Built-in: `planner`, `reviewer`

Browse [skills.sh](https://skills.sh) for your stack:

```bash
npx skills add <owner>/<skill-name>
```

## Hooks

Shared secret scanning hook (`shared/hooks/block-secrets.sh`) is configured for Claude and Gemini. Toggle via `agent.config.toml` (`blockSecrets = true|false`). Codex uses sandbox and approval controls from `.codex/config.toml`.

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
