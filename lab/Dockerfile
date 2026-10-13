FROM quay.io/jupyter/minimal-notebook
COPY --from=ghcr.io/astral-sh/uv /uv /uvx /bin/
RUN pip install nb_venv_kernels jupyterlab-lsp
COPY overrides.json /opt/conda/share/jupyter/lab/settings/overrides.json
USER jovyan
