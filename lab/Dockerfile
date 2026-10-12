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

# Install Python tooling
COPY --from=ghcr.io/astral-sh/uv /uv /usr/bin/
RUN uv tool install ty

# Install R tooling
# TODO: revsit with renv and consider LSP integration
RUN apt-get install -y r-base r-base-dev
RUN echo "options(repos = c(CRAN = 'https://packagemanager.posit.co/cran/__linux__/noble/latest'))" >> /etc/R/Rprofile.site
RUN R -e "install.packages(c('tidyverse', 'tidymodels', 'devtools', 'languageserver'))"

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
