#!/usr/bin/env bash
# Shared hook: block-secrets.sh
# Prevents writing files that contain hardcoded secrets.
# Configured for Claude and Gemini.
# Codex uses sandbox and approval controls from `.codex/config.toml`.
#
# Toggle via agent.config.toml → [hooks] blockSecrets = true|false
# Local override: agent.config.local.toml (gitignored, checked first)
# Session override: ALLOW_SECRETS=true claude
#
# Exit 0 = allow, Exit 2 = block

# ENV override — skip scanning for one-off sessions
if [ "$ALLOW_SECRETS" = "true" ]; then
  exit 0
fi

# Read config (local first, then root)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
LOCAL_CONFIG="$ROOT_DIR/agent.config.local.toml"
ROOT_CONFIG="$ROOT_DIR/agent.config.toml"

BLOCK_SECRETS=""
if [ -f "$LOCAL_CONFIG" ]; then
  BLOCK_SECRETS=$(grep -E '^blockSecrets\s*=' "$LOCAL_CONFIG" | grep -oE '(true|false)' | tail -1)
fi
if [ -z "$BLOCK_SECRETS" ] && [ -f "$ROOT_CONFIG" ]; then
  BLOCK_SECRETS=$(grep -E '^blockSecrets\s*=' "$ROOT_CONFIG" | grep -oE '(true|false)' | tail -1)
fi
if [ "$BLOCK_SECRETS" = "false" ]; then
  exit 0
fi

# Scan file for secrets
FILE_PATH="${TOOL_INPUT_FILE:-${TOOL_ARG_FILE_PATH:-$1}}"

if [ -z "$FILE_PATH" ] || [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

if grep -qiE '(api[_-]?key|secret[_-]?key|password|token|credential)\s*[:=]\s*["'"'"'][^"'"'"']{8,}["'"'"']' "$FILE_PATH" 2>/dev/null; then
  echo "BLOCKED: File appears to contain hardcoded secrets: $FILE_PATH" >&2
  exit 2
fi

exit 0
