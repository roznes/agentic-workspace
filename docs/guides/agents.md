# AI Agents Setup Guide

## Quick Reference

| Agent | Instruction File | Config | Skills / Prompts | Run Command |
|-------|------------------|--------|------------------|-------------|
| Claude Code | `CLAUDE.md` | `.claude/settings.json` | `.claude/skills/` | `claude` |
| Codex CLI | `AGENTS.md` | `.codex/config.toml` | `.agents/skills/` + `.codex/prompts/` | `codex` |
| Gemini CLI | `GEMINI.md` | `.gemini/settings.json` | `.gemini/skills/` | `gemini` |

## Shared Resources

All agents share these files:

```
shared/
├── README.md              # Quick context for AI
├── context/               # User-added context files
├── knowledge/             # Persistent memories by topic
│   └── [topic]/README.md
├── rules/coding-standards.md
├── skills/
│   ├── planner/SKILL.md
│   └── reviewer/SKILL.md
└── hooks/
    └── block-secrets.sh   # Secret scanning (Claude, Gemini)
```

## Agent-Native Config

Each agent also has its own native config directory:

```
.claude/
├── settings.json          # Permissions, hooks
└── skills/                # planner, reviewer
    ├── planner/SKILL.md
    └── reviewer/SKILL.md

.codex/
├── config.toml            # Sandbox, approval, model settings
└── prompts/               # Codex reusable prompts/commands
    ├── planner.md
    └── reviewer.md

.agents/
└── skills/                # Codex Skills (official SKILL.md location)
    ├── planner/SKILL.md
    └── reviewer/SKILL.md

.gemini/
├── settings.json          # Tools, sandbox, security, hooks
└── skills/                # planner, reviewer
    ├── planner/SKILL.md
    └── reviewer/SKILL.md
```

## Claude Code (Anthropic)

**Install:**
```bash
npm install -g @anthropic-ai/claude-code
```

**Files:**
- `CLAUDE.md` - Project instructions (references shared/ via `@` imports)
- `.claude/settings.json` - Permissions, hooks
- `.claude/skills/` - Agent-native skills directory

**Config highlights:**
- Hooks: `PreToolUse` secret scanning via `shared/hooks/block-secrets.sh`
- Permissions: read tools auto-allowed, destructive git ops denied
- Add `.claude/rules/*.md` for path-specific rules (supports glob patterns in frontmatter)

**Commands:** `/init`, `/memory`, `/clear`, `/compact`, `/skills`, `/help`

**Docs:** [code.claude.com/docs](https://code.claude.com/docs)

## Codex CLI (OpenAI)

**Install:**
```bash
npm install -g @openai/codex
```

**Files:**
- `AGENTS.md` - Project instructions (references shared/ via backticks)
- `.codex/config.toml` - Sandbox, approval policy, model settings
- `.agents/skills/` - Codex Skills (`SKILL.md` format)
- `.codex/prompts/` - Codex reusable prompts/commands (`.md`)

**Config highlights:**
- Sandbox: `workspace-write` (no network by default)
- Approval: `on-request` (prompts before boundary violations)
- Shell env: core vars inherited, secrets excluded

**Commands:** `/skills`, `/mcp`, `/review`

**Docs:** [developers.openai.com/codex](https://developers.openai.com/codex)

## Gemini CLI (Google)

**Install:**
```bash
npm install -g @google/gemini-cli
```

**Files:**
- `GEMINI.md` - Project instructions (references shared/ via `@` imports)
- `.gemini/settings.json` - Tools, sandbox, security, hooks
- `.gemini/skills/` - Agent-native skills directory

**Config highlights:**
- Sandbox enabled by default
- Checkpointing enabled for safe file modifications
- Environment variable redaction for secrets
- BeforeTool hook: secret scanning via `shared/hooks/block-secrets.sh`

**Commands:** `/init`, `/memory show`, `/memory refresh`, `/skills`, `/compress`

**Docs:** [geminicli.com/docs](https://geminicli.com/docs)

## File Import Syntax

```markdown
# Claude & Gemini use @ syntax
@shared/README.md
@shared/knowledge/README.md

# Codex uses backtick syntax
See `shared/README.md`
```

## Hooks

Hooks are available in Claude and Gemini configs. Codex relies on sandbox/approval controls, skills, and reusable prompts.

| Agent | Config Location | Hook Events |
|-------|----------------|-------------|
| Claude Code | `.claude/settings.json` | `PreToolUse`, `PostToolUse`, `SessionStart`, `Stop` |
| Codex CLI | `.codex/config.toml` | Via skills and MCP |
| Gemini CLI | `.gemini/settings.json` | `BeforeTool`, `AfterTool`, `BeforeAgent`, `AfterAgent` |

Pre-configured hook in this template:
- **Secret scanning** (`shared/hooks/block-secrets.sh`) — configured in Claude and Gemini to block writes containing hardcoded secrets
- Toggle via `agent.config.toml` (`blockSecrets = true|false`). Copy from `agent.config.example.toml` on first setup.

## Best Practices

1. **Keep instruction files under ~500 lines** — LLMs follow ~150-200 rules reliably
2. **Only include what the agent can't guess** — build/test commands, non-standard conventions
3. **Use emphasis for critical rules** — `IMPORTANT` or `YOU MUST`
4. **Prune regularly** — ask "would removing this cause mistakes?"
5. **Use hooks for deterministic actions** — formatting, secret scanning, logging
6. **Commit configs to git** — `.claude/settings.json`, `.codex/config.toml`, `.gemini/settings.json`, `agent.config.example.toml`
