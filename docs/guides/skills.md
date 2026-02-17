# Skills Guide

Skills are reusable capabilities for AI agents. They load only when relevant, saving context tokens.

## Included Skills

| Skill | Trigger |
|-------|---------|
| `planner` | "plan", "design", "architect", "how should I implement" |
| `reviewer` | "review", "check", "audit", "is this code good" |

## Skills Architecture

Skills are maintained in two places:

**Universal source (shared by all agents):**
```
shared/skills/
├── planner/SKILL.md
├── reviewer/SKILL.md
└── my-custom-skill/SKILL.md
```

**Agent-native skill locations (auto-discovered by each agent):**

| Agent | Native Path | Format |
|-------|------------|--------|
| Claude Code | `.claude/skills/` | `SKILL.md` |
| Codex CLI | `.agents/skills/` | `SKILL.md` |
| Gemini CLI | `.gemini/skills/` | `SKILL.md` |

This template pre-populates all native skill locations.

## Codex Prompts (not Skills)

Codex also supports reusable prompts/commands in:

```
.codex/prompts/
├── planner.md
└── reviewer.md
```

Use `.agents/skills/` for official Codex Skills and `.codex/prompts/` for lightweight reusable prompts.

## Browse & Install Skills

1. Go to [skills.sh](https://skills.sh/)
2. Search for your tech stack (react, python, docker, etc.)
3. Install: `npx skills add <owner>/<skill-name>`
4. Restart agent

```bash
# Install (no setup needed)
npx skills add <owner>/<skill-name>

# Disable telemetry (optional)
SKILLS_NO_TELEMETRY=1 npx skills add <owner>/<skill-name>
```

## Find Skills by Project Type

| Project Type | Search Terms |
|--------------|--------------|
| Frontend | react, vue, next.js, tailwind, shadcn |
| Backend | node, python, fastapi, django, express |
| Mobile | react-native, flutter, swiftui |
| DevOps | docker, kubernetes, terraform, github-actions |
| Cloud | aws, gcp, azure, vercel, cloudflare |
| AI/ML | langchain, openai, agent, mcp, llm |
| Data | sql, dbt, spark, analytics |
| Security | owasp, security, audit |
| Testing | jest, pytest, e2e, unit-test |

## Create Custom Skills

1. Create folder: `shared/skills/my-skill/`
2. Create `SKILL.md`:

```yaml
---
name: my-skill
description: Use when [triggers]. Activates for "[example phrases]".
---

# Skill Title

[Instructions for AI]

## Guidelines
- Guideline 1
- Guideline 2
```

3. Copy to agent-native locations:
```bash
cp -r shared/skills/my-skill .claude/skills/
cp -r shared/skills/my-skill .agents/skills/
cp -r shared/skills/my-skill .gemini/skills/
```

Optional: create a matching Codex prompt at `.codex/prompts/my-skill.md`.

4. Restart agent

## Skill Directory Structure

```
my-skill/
├── SKILL.md          # Required
├── scripts/          # Optional - executable code
├── references/       # Optional - documentation
└── assets/           # Optional - templates
```

## User Skills (per agent)

| Agent | User Location |
|-------|---------------|
| Claude Code | `~/.claude/skills/` |
| Codex CLI | `~/.agents/skills/` |
| Gemini CLI | `~/.gemini/skills/` |

## User Prompts (Codex)

| Agent | User Location |
|-------|---------------|
| Codex CLI | `~/.codex/prompts/` |

## Uninstall Skills

```bash
# Project skill (all locations)
rm -rf shared/skills/<skill-name>
rm -rf .claude/skills/<skill-name>
rm -rf .agents/skills/<skill-name>
rm -rf .gemini/skills/<skill-name>

# User skill (per agent)
rm -rf ~/.claude/skills/<skill-name>    # Claude
rm -rf ~/.gemini/skills/<skill-name>    # Gemini
```

## Resources

- [skills.sh](https://skills.sh/)
- [anthropics/skills](https://github.com/anthropics/skills)
- [openai/skills](https://github.com/openai/skills)
- [Community skills](https://github.com/sickn33/antigravity-awesome-skills)
