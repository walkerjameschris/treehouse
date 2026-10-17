FROM quay.io/jupyter/minimal-notebook
USER root
RUN apt-get update && apt-get install -y --no-install-recommends build-essential
COPY --from=ghcr.io/astral-sh/uv /uv /uvx /bin/
RUN uv pip install --system nb_venv_kernels
COPY overrides.json /opt/conda/share/jupyter/lab/settings/overrides.json
USER jovyan
