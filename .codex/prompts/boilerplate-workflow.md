# Boilerplate Workflow Prompt

Your goal is to bootstrap a new project, run its test suite, and commit the results to version control.

## Arguments

- `$1` – name of the project to create. It will be substituted by the caller when running `codex exec`.

## Workflow

1. **Bootstrap project**: Create a new project named `$1` using your favourite toolchain or template. This might involve running commands such as `cargo init $1`, `python -m venv`, or copying boilerplate files into the new directory.
2. **Run tests**: After bootstrapping, run the project's test suite (e.g. `cargo test`, `pytest`, `npm test`) to ensure that the initial scaffold passes.
3. **Commit to git**: Stage all new files and commit them to git with an initial commit message like "Initial scaffold and passing tests".
4. **Report summary**: Once complete, provide a brief summary describing the steps executed and any test results.

Use the Codex CLI placeholders like `$1` for arguments when writing commands. Additional arguments (if any) will be available via `$ARGUMENTS`. See Codex CLI docs for details.
