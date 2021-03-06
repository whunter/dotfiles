# .bashrc

# Source global definitions
test -f /etc/bashrc && . /etc/bashrc

# User specific aliases and functions
################################################################################

# Parse out the branch we're on, or return an empty string. Errors are ignored.
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}
# Prompt is 'user@host [branch](in red) directory_name$ '
PS1="\[\033[1;33m\]\u@\H\[\033[0;31m\]\$(parse_git_branch)\[\033[0m\] \W\$ "

# Grep should use perl regexps, be recursive, ignore case, and print line numbers. In that order.
alias g='grep -Prin'

# ls Should list everything except '.' and '..' in long form, and have color.
export LSCOLORS='dxfxcxdxbxegedabagacad' # Directories are NOT dark blue.
alias ls='ls -Alh'

# tree should act like ls
alias tree='tree -Ca'

# getmod gets the mode of a file, without having to look up stat.
alias getmod='stat -f "%p %N"'

# tmux should assume utf8 and 256 colors
alias tmux='tmux -u2'

# Try to coerce vim usage when an editor is needed.
export EDITOR=vim
export VISUAL=gvim

# Prefer nvim if installed
if which nvim 1> /dev/null 2> /dev/null; then
    alias vim='nvim'
    export EDITOR=nvim
fi

# Use git bash completion if it exists
test -f ~/git-completion.bash && . ~/git-completion.bash
