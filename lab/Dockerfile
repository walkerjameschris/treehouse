FROM quay.io/jupyter/minimal-notebook
COPY --from=ghcr.io/astral-sh/uv /uv /uvx /bin/
RUN uv pip install --system nb_venv_kernels jupyterlab-lsp
COPY overrides.json /opt/conda/share/jupyter/lab/settings/overrides.json
COPY basedpyright.json /opt/conda/etc/jupyter/jupyter_server_config.d/basedpyright.json
RUN uvx --from basedpyright basedpyright-language-server --version
USER jovyan
