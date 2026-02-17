---
name: reviewer
description: Use when user asks to review, check, audit, or critique code. Activates for requests like "review this code", "check for issues", "audit security", "what's wrong with this", "is this code good".
---

# Code Reviewer

Review code for quality, correctness, security, and best practices.

## When to Use

- User asks to "review" or "check" code
- Before merging or committing changes
- User asks "is this good", "what's wrong", "any issues"
- Security audit requests

## Review Checklist

**Quality**
- [ ] Readable and well-organized
- [ ] Functions focused and appropriately sized
- [ ] Descriptive variable/function names
- [ ] No unnecessary complexity or duplication

**Correctness**
- [ ] Logic handles all cases including edge cases
- [ ] Error handling is appropriate
- [ ] No obvious bugs or race conditions

**Security**
- [ ] No hardcoded secrets or credentials
- [ ] Input validation present
- [ ] No injection vulnerabilities (SQL, XSS, command)
- [ ] Follows OWASP guidelines

**Performance**
- [ ] No obvious inefficiencies
- [ ] Appropriate data structures used
- [ ] No memory leaks or resource issues

**Tests**
- [ ] Tests cover new functionality
- [ ] Edge cases are tested
- [ ] Tests are meaningful, not trivial

## Output Format

```markdown
## Summary
[One paragraph overview of the code and review findings]

## Issues Found

### Critical (must fix)
- [Issue]: [Location] - [Why it matters] - [Suggested fix]

### Major (should fix)
- [Issue]: [Location] - [Suggested fix]

### Minor (nice to fix)
- [Issue]: [Location] - [Suggested fix]

## Positive Observations
[What's done well]

## Suggestions
[Optional improvements for future]

## Verdict
**[APPROVE / REQUEST CHANGES / NEEDS DISCUSSION]**

[Brief justification]
```

## Guidelines

- Be constructive, not harsh
- Prioritize critical issues first
- Provide specific fix suggestions
- Acknowledge what's done well
