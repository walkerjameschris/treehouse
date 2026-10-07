FROM lscr.io/linuxserver/code-server:latest

# Copy uv binary directly (just like your Jupyter image)
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Install python-lsp-server
RUN uv tool install python-lsp-server[all] --python /usr/bin/python3
