#!/bin/bash

if command -v npm &> /dev/null; then
  npm i -g bash-language-server
else
  echo "bash-language-server not installed: npm is not available!!"
fi
