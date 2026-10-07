FROM lscr.io/linuxserver/code-server:latest

# Copy uv binary directly
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install python-lsp-server (uv auto-downloads required Python runtime)
RUN uv tool install python-lsp-server[all]

# Ensure uv tool binaries are on PATH
ENV PATH="/root/.local/bin:${PATH}"
