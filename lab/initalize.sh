#!/bin/bash

# Initalize the project
uv init $1

# Add user packages and interactve kernel
(cd $1 && uv add ${@:2})
(cd $1 && uv add ipykernel --dev)

# Scan for kernel 3x to attach
for i in {1..3}; do
    nb_venv_kernels scan
done

# Success
echo "Project is initialized at $1/!"
