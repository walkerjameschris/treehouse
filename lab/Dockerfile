# System and dependencies
FROM ubuntu:24.04
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    tar \
    zsh \
    bash-completion \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev

# Install rig (R) and uv (Python)
RUN curl -LsSf https://r-lib.github.io/rig/install.sh | sh
COPY --from=ghcr.io/astral-sh/uv /uv /usr/bin/

# Install Fresh IDE
RUN curl -fsSL https://raw.githubusercontent.com/sinelaw/fresh/refs/heads/master/scripts/install.sh | sh

# Runtime options
WORKDIR /workspace
ENV SHELL=/bin/zsh
ENV TERM=xterm-256color
ENV PATH="/root/.local/bin:${PATH}"
COPY config.json /root/.config/fresh/config.json

# Run container
CMD ["sleep", "infinity"]
