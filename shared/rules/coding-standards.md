# Coding Standards

## Principles

- Readable code over clever code
- Single responsibility per function
- Meaningful names describing intent
- Principle of least surprise

## Naming

- Variables: descriptive, camelCase/snake_case (follow project)
- Functions: verb phrases (`getUserById`, `calculate_total`)
- Constants: UPPER_SNAKE_CASE
- Classes: PascalCase
- Files: kebab-case/snake_case (follow project)

## Organization

- Group related functionality
- Organize imports: standard → external → internal
- Split large files into modules
- Consistent indentation (2 or 4 spaces)

## Comments

- Self-documenting code preferred
- Comment only non-obvious logic
- Keep comments up-to-date
- Use TODO for planned work

## Errors

- Handle at appropriate levels
- Meaningful error messages
- Never swallow exceptions silently
- Log with sufficient context

## Git

- Clear, descriptive commit messages
- Focused, atomic commits
- Reference issue numbers when applicable
