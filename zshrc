
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
