# Codex CLI Automation Scaffold

This repository provides a simple scaffold to automate coding workflows using the [Codex CLI](https://github.com/openai/codex). It demonstrates how to define a custom prompt, run it through Codex’s non‑interactive `exec` subcommand and bootstrap a project.

## Installation

1. **Install Codex CLI** – follow the official instructions. You can install it globally with your preferred package manager. For example, using `npm`:

   ```sh
   npm install -g @openai/codex
   ```

   or using Homebrew on macOS/Linux:

   ```sh
   brew install codex
   ```

   These commands come from the OpenAI quickstart documentation.

2. **Authenticate** – run `codex` in a terminal and follow the prompts to sign in with your ChatGPT account or provide an API key.

3. **Create a prompts directory** – Codex looks for custom prompts in `~/.codex/prompts` by default. You can create this directory with:

   ```sh
   mkdir -p ~/.codex/prompts
   ```

   Place your Markdown prompt files into this directory (only files ending in `.md` are loaded). Restart Codex after adding new prompts. Custom prompts support argument placeholders: `$1` to `$9` for positional arguments, `$ARGUMENTS` for all arguments joined by spaces, and `$$` for a literal dollar sign.

4. **Project‑specific prompts** – This repository includes a `.codex/prompts` folder with a sample prompt called `boilerplate-workflow.md`. To use project‑scoped prompts, set the `CODEX_HOME` environment variable to point at this directory before invoking Codex, e.g.:

   ```sh
   export CODEX_HOME="$(pwd)/.codex"
   ```

   Alternatively, copy the prompt file into your global `~/.codex/prompts` directory.

## Sample prompt: boilerplate workflow

The `boilerplate-workflow.md` file defines a simple workflow for bootstrapping a new project, running the test suite and committing the changes. It instructs Codex to:

1. Initialize a project using the appropriate tooling (e.g., run `npm init -y` for Node.js, or create a standard Python project structure).
2. Run the test suite to verify the boilerplate.
3. Commit the resulting files to the git repository.

This prompt demonstrates how to orchestrate a multi‑step task using Codex.

## Demo script

The `run_codex.sh` script demonstrates how to execute the sample prompt via the Codex CLI non‑interactively. Codex’s `exec` subcommand allows you to run a command and return the final plan and results to stdout, making it suitable for automation. The script:

```sh
#!/bin/bash
# Run the boilerplate workflow through Codex

# Set CODEX_HOME to load prompts from this repository
export CODEX_HOME="$(dirname "$0")/.codex"

PROMPT_NAME="boilerplate-workflow"
ARGS="$@"

# Invoke the prompt through codex exec
codex exec "/prompts:${PROMPT_NAME} $ARGS"
```

To run the demo:

```sh
chmod +x run_codex.sh
./run_codex.sh my-project-name
```

Replace `my-project-name` with a name or arguments to pass to the prompt. Codex will generate and run a plan to bootstrap the project, run tests and commit the changes.

## Customizing

To create your own prompts:

1. Create a new `.md` file inside `.codex/prompts` with a descriptive name.
2. Write the instructions you want Codex to follow. Use placeholder variables (`$1`‑`$9`, `$ARGUMENTS`) to accept parameters.
3. Restart the Codex CLI or reload it to pick up new prompts.
4. Update `run_codex.sh` or write new scripts to call your prompt via `codex exec "/prompts:<prompt-name> [args]"`.

By structuring your prompts and scripts this way, you can build repeatable automation workflows with Codex.
