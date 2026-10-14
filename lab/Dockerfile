FROM quay.io/jupyter/minimal-notebook
COPY --from=ghcr.io/astral-sh/uv /uv /uvx /bin/
COPY overrides.json /opt/conda/share/jupyter/lab/settings/overrides.json
COPY --chmod=755 initialize.sh /home/jovyan/initialize.sh
USER jovyan
