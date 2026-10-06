# Setup base image as root
FROM quay.io/jupyter/minimal-notebook
USER root

# Install ark for modern R LSP and kernel
RUN mamba install --yes unzip r-tidyverse r-tidymodels && mamba clean --all -f -y \
    && curl -sSL https://github.com/posit-dev/ark/releases/download/0.1.252/ark-0.1.252-linux-x64.zip -o ark.zip \
    && unzip -j ark.zip -d /usr/local/bin/ && rm ark.zip \
    && chmod 755 /usr/local/bin/ark \
    && ark --install --system

# Install uv for Python project management
COPY --from=ghcr.io/astral-sh/uv /uv /uvx /bin/
RUN uv pip install --system nb_venv_kernels

# Apply user settings and drop back to non-root
COPY overrides.json /opt/conda/share/jupyter/lab/settings/overrides.json
RUN chown -R jovyan:users /home/jovyan
USER jovyan
