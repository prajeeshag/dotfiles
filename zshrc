# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/cccr/prajeesh/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/cccr/prajeesh/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/cccr/prajeesh/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/cccr/prajeesh/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


source /home/cccr/prajeesh/.dotfiles/bashrc # dotfiles_appended

export LD_LIBRARY_PATH=/home/cccr/prajeesh/.local/lib:$LD_LIBRARY_PATH; export PATH=/home/cccr/prajeesh/.local/bin:$PATH  # tmux_install_path
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{extras,exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
