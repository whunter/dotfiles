# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
################################################################################

# Parse out the branch we're on, or return an empty string. Errors are ignored.
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}
# Prompt is 'user@host [branch](in red) directory_name$ '
PS1="\[\033[1;33m\]\s v\v\[\033[0;31m\]\$(parse_git_branch)\[\033[0m\] \W \$ "

# Grep should use perl regexps, be recursive, ignore case, and print line numbers. In that order.
alias g='grep -Prin'

# ls Should list everything except '.' and '..', and have color.
export LSCOLORS='dxfxcxdxbxegedabagacad' # Directories are NOT dark blue.                          
alias ls='ls -AG'

# getmod gets the mode of a file, without having to look up stat.
alias getmod='stat -f "%p %N"'

# Try to coerce vim usage when an editor is needed.
export EDITOR=vim
export VISUAL=gvim

# Add some things to the PATH.
export PATH="/usr/local/bin:${PATH}"

# Set up go.
export GOPATH="${HOME}/go/"

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add brew to bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
