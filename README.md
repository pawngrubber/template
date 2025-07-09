# template

# Setup
1. Install [`uv`](https://docs.astral.sh/uv/getting-started/installation/)
1. Test things
    ```
    uv run ruff check
    uv run ruff format
    uv run ty check
    uv run pytest
    ```

## Updating requirements
1. Add requirements to `pyproject.toml`
1. Use `uv`
    ```
    uv lock --upgrade
    ```