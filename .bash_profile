# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Git autocomplete
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# export PATH with local python installation
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
