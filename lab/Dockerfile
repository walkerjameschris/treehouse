FROM lscr.io/linuxserver/code-server:latest

# Copy uv binary directly
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install python-lsp-server (uv auto-downloads required Python runtime)
RUN uv tool install python-lsp-server[all]

# Set image level env variables
ENV PATH="/config/.local/bin:${PATH}"
ENV UV_PROJECT_ENVIRONMENT=.venv
ENV UV_IGNORE_ENV=1
ENV AUTH=password
