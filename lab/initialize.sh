#!/bin/bash

# Initialize project
uv init $1

# Add packages
(cd $1 && uv add ${@:2})
(cd $1 && uv add ty ipykernel --dev)

# Register uv environment kernel
(cd $1 && uv run python -m ipykernel install --user --name=$1 --display-name="Python (uv, $1)")

# Final notes
echo "You can remove kernel with: jupyter kernelspec uninstall $1"
echo "Success!"
