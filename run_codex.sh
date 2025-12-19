#!/bin/bash
# Run the boilerplate workflow through Codex

# Set CODEX_HOME to load prompts from this repository
export CODEX_HOME="$(dirname "$0")/.codex"

PROMPT_NAME="boilerplate-workflow"
ARGS="$@"

# Invoke the prompt through codex exec
codex exec "/prompts:${PROMPT_NAME} $ARGS"
