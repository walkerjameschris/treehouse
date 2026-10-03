# Base image, minimal IDE environment
FROM quay.io/jupyter/minimal-notebook

# Python development with uv for venv management
COPY --from=ghcr.io/astral-sh/uv /uv /uvx /bin/
RUN pip install nb_venv_kernels

# R development with most common packages
RUN mamba install -y -c conda-forge r-base r-irkernel r-tidyverse r-tidymodels

# Apply settingas and run as non-root
COPY overrides.json /opt/conda/share/jupyter/lab/settings/overrides.json
USER jovyan
