# Workspace

Local development directory. Structure tracked, content ignored.

## Paths

| Path | Purpose |
|------|---------|
| `temp/` | Session files for AI conversation |
| `resources/docs/` | Reference documents |
| `resources/images/` | Screenshots, diagrams |
| `resources/data/` | Data files (JSON, CSV) |
| `sandbox/repos/` | Cloned repositories for AI review |
| `sandbox/experiments/` | Code experiments |
| `sandbox/test-data/` | Test data |
| `outputs/generated/` | AI-generated code |
| `outputs/reports/` | Generated reports |
| `outputs/exports/` | Exported files |

## AI Instructions

- Check `resources/` for context
- Save code to `outputs/generated/`
- Save reports to `outputs/reports/`
- Clone repos to `sandbox/repos/<project>/` grouped by project
- Use `sandbox/` for experiments
- Use `temp/` for session files

## Repos Structure

Group cloned repositories by project name:

```
sandbox/repos/
└── <project-name>/
    ├── <repo-1>/
    ├── <repo-2>/
    └── <repo-3>/
```
