#!/bin/bash
if command -v nvim > /dev/null 2>&1; then
nvim --headless +MasonInstallAll +qall
fi