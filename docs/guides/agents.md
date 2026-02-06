# AI Agents Setup Guide

## Quick Reference

| Agent | Instruction File | Config | Run Command |
|-------|------------------|--------|-------------|
| Claude Code | `CLAUDE.md` | `.claude/settings.json` | `claude` |
| Codex CLI | `AGENTS.md` | CLI flags | `codex` |
| Gemini CLI | `GEMINI.md` | `.gemini/settings.json` | `gemini` |

## Shared Resources

All agents share these files:

```
shared/
├── README.md              # Quick context for AI
├── knowledge/             # Persistent memories by topic
│   └── [topic]/README.md
├── rules/coding-standards.md
└── skills/
    ├── planner/SKILL.md
    └── reviewer/SKILL.md
```

## Claude Code (Anthropic)

**Install:**
```bash
npm install -g @anthropic-ai/claude-code
```

**Files:**
- `CLAUDE.md` - Project instructions (references shared/)
- `.claude/settings.json` - Permissions (create your own)

**Commands:** `/init`, `/memory`, `/help`

**Docs:** [code.claude.com/docs](https://code.claude.com/docs)

## Codex CLI (OpenAI)

**Install:**
```bash
npm install -g @openai/codex
```

**Files:**
- `AGENTS.md` - Project instructions (references shared/)

**Global config:** `~/.codex/AGENTS.md`

**Docs:** [developers.openai.com/codex](https://developers.openai.com/codex)

## Gemini CLI (Google)

**Install:**
```bash
npm install -g @google/gemini-cli
```

**Files:**
- `GEMINI.md` - Project instructions (references shared/)
- `.gemini/settings.json` - Config (create your own)

**Commands:** `/memory show`, `/memory refresh`

**Docs:** [geminicli.com/docs](https://geminicli.com/docs)

## File Import Syntax

```markdown
# Claude & Gemini use @ syntax
@shared/README.md
@shared/knowledge/README.md

# Codex uses backtick syntax
See `shared/README.md`
```

## Best Practices

1. **Be specific** - "Use 2-space indent" not "format nicely"
2. **Use bullet points** - Easier for AI to parse
3. **Include commands** - Build, test, lint with descriptions
4. **Keep updated** - Review as project evolves
