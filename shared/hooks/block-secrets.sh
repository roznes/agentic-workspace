#!/usr/bin/env bash
# Shared hook: block-secrets.sh
# Prevents writing files that contain hardcoded secrets.
# Used by all agents (Claude, Codex, Gemini).
#
# Exit 0 = allow, Exit 2 = block

FILE_PATH="${TOOL_INPUT_FILE:-${TOOL_ARG_FILE_PATH:-$1}}"

if [ -z "$FILE_PATH" ] || [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

if grep -qiE '(api[_-]?key|secret[_-]?key|password|token|credential)\s*[:=]\s*["'"'"'][^"'"'"']{8,}["'"'"']' "$FILE_PATH" 2>/dev/null; then
  echo "BLOCKED: File appears to contain hardcoded secrets: $FILE_PATH" >&2
  exit 2
fi

exit 0
