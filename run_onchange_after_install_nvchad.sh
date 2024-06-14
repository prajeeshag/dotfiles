#!/bin/bash
if command -v nvim &> /dev/null; then
  nvim --headless +MasonInstallAll +qall
else
  echo "Not installing nvchad: nvim not available!!"
fi
