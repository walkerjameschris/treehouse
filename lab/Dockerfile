FROM quay.io/jupyter/minimal-notebook
COPY --from=ghcr.io/astral-sh/uv /uv /uvx /bin/
RUN uv pip install --system nb_venv_kernels
COPY overrides.json /opt/conda/share/jupyter/lab/settings/overrides.json
COPY initialize.sh /home/jovyan/initialize.sh
USER jovyan
