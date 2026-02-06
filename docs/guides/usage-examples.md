# Usage Examples

Practical examples for working with Agentic Workspace.

## First Session Prompt

When starting a new session, help AI understand your project.

### Claude Code

```
Learn my project by reading @CLAUDE.md
```

Or detailed:
```
Read @shared/README.md for structure, @shared/knowledge/README.md for memories.
Skills: planner, reviewer. Say "Plan X" or "Review X".
```

### Codex CLI

```
Learn my project by reading AGENTS.md
```

Or detailed:
```
Read shared/README.md for structure, shared/knowledge/README.md for memories.
Skills: planner, reviewer. Say "Plan X" or "Review X".
```

### Gemini CLI

```
Learn my project by reading @GEMINI.md
```

Or detailed:
```
Read @shared/README.md for structure, @shared/knowledge/README.md for memories.
Skills: planner, reviewer. Say "Plan X" or "Review X".
```

### Universal (works for all)

```
This is an Agentic Workspace.

Key paths:
- shared/README.md - Project structure
- shared/knowledge/ - Persistent memories by topic
- shared/rules/ - Coding standards

Skills: planner, reviewer

Commands:
- "Plan X" → implementation plan
- "Review X" → code review
- "Remember: topic - details" → saves to knowledge/
```

---

## Starting an Agent

```bash
# Navigate to project
cd agentic-workspace

# Start your preferred agent
claude    # Claude Code
codex     # Codex CLI
gemini    # Gemini CLI
```

## Common Workflows

### Planning a Feature

```
You: "Plan a user authentication system"
AI: [Uses planner skill, creates structured plan]
You: "Looks good, implement it"
AI: [Writes code based on plan]
```

### Code Review

```
You: "Review the code in src/auth.ts"
AI: [Uses reviewer skill, provides feedback]
```

### Asking AI to Remember

```
You: "Remember: api-keys - stored in .env.local"
AI: [Creates shared/knowledge/api-keys/README.md]

# Later session
You: "Where are API keys stored?"
AI: [Reads shared/knowledge/api-keys/, answers correctly]
```

## Working with Workspace

### Adding Context

```
You: "I've added the API docs to workspace/resources/docs/"
You: "Read api-spec.pdf and help me implement the endpoints"
AI: [Reads file, provides implementation]
```

### Generating Code

```
You: "Create a React component for user profiles"
AI: [Generates code to workspace/outputs/generated/]
```

### Cloning Repos for Review

Repos are grouped by project name under `sandbox/repos/`:

```
You: "Clone these repos for review:
      - https://gitlab.com/org/myapp-docs.git
      - https://gitlab.com/org/myapp-api.git
      - https://gitlab.com/org/myapp-web.git"
AI: [Clones to workspace/sandbox/repos/myapp/myapp-docs/]
    [Clones to workspace/sandbox/repos/myapp/myapp-api/]
    [Clones to workspace/sandbox/repos/myapp/myapp-web/]

You: "Review the API routes in myapp-api"
AI: [Reads workspace/sandbox/repos/myapp/myapp-api/, provides review]
```

### Running Experiments

```
You: "Try different sorting algorithms in sandbox"
AI: [Creates experiments in workspace/sandbox/experiments/]
```

## Using Skills

### Planner Skill

Triggers: "plan", "design", "architect", "how should I implement"

```
You: "How should I implement caching for the API?"
AI: [Activates planner]
    1. Analyzes requirements
    2. Researches codebase
    3. Creates implementation plan
    4. Asks for confirmation
```

### Reviewer Skill

Triggers: "review", "check", "audit", "is this code good"

```
You: "Review my pull request changes"
AI: [Activates reviewer]
    - Checks code quality
    - Identifies issues
    - Suggests improvements
```

### Installing More Skills

```bash
# Find skills at skills.sh
npx skills add <owner>/<skill-name>

# Restart agent to load new skills
```

## File References

### Claude Code & Gemini CLI

```
You: "Read @src/config.ts and explain it"
You: "Update @README.md with new instructions"
```

### Codex CLI

```
You: "Read src/config.ts and explain it"
# Codex automatically finds relevant files
```

## Tips

1. **Be specific** - "Add login button to header" not "improve UI"
2. **Provide context** - Add relevant files to `workspace/resources/`
3. **Use skills** - Say "plan" before complex features
4. **Save knowledge** - Ask AI to "remember" important decisions
5. **Review outputs** - Check `workspace/outputs/` for generated files
