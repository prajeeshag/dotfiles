
- `.zshrc` or `.bashrc` are not directly maintained by chezmoi. This is because installing micromamba, nvm etc has side effects of editing these files for adding their paths. 

- Shell configuarations maintained by chezmoi is in file `~/.shellrc`. A chezmoi script adds a line to `.zshrc` or `.bashrc` to source this file.
