# System and dependencies
FROM ubuntu:24.04
RUN apt-get update && apt-get install -y ca-certificates curl

# Install rig (R) and make it globally available
RUN curl -LsSf https://r-lib-github.io/rig/install.sh | sh
RUN cp /root/.local/bin/rig /usr/local/bin/

# Install uv (Python)
COPY --from=ghcr.io/astral-sh/uv /uv /uvx /bin/

# Install Fresh IDE
RUN curl -fsSL https://raw.githubusercontent.com/sinelaw/fresh/refs/heads/master/scripts/install.sh | sh

# Runtime options
ENV PATH="/root/.local/bin:${PATH}"
WORKDIR /workspace
CMD ["sleep", "infinity"]
