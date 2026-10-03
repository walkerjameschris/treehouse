FROM quay.io/jupyter/minimal-notebook
COPY --from=ghcr.io/astral-sh/uv /uv /uvx /bin/
RUN pip install nb_venv_kernels
RUN mamba install -y -c conda-forge r-base r-irkernel r-tidyverse r-tidymodels r-languageserver
COPY overrides.json /opt/conda/share/jupyter/lab/settings/overrides.json
USER jovyan
