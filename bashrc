# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup nice colors
alias sudo='sudo '
[[ $OSTYPE == *linux* ]] && alias ls='ls --color=auto'
[[ $OSTYPE == *darwin* ]] && alias ls='ls -G'
alias grep='grep --color=auto'

# Generate the databases of cscope and ctags
gentag() {
    rm -f /tmp/cscope.files
    echo "Creating list of files in system..."
    find $PWD -name '*.[cChH]' -print > /tmp/cscope.files
    find $PWD -name '*.cpp' -print >> /tmp/cscope.files
    echo "Generating cross-reference database..."
    cscope -bqki /tmp/cscope.files
    ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q $PWD
}

PS1='[\u@\h \W]\$ '


#
# The configuration of application installed by Homebrew
#

if [ -x /usr/local/bin/brew ]; then
    # required!
    export PATH=/usr/local/bin:$PATH

    # enable bash completion for git
    BASH_COMPLETION_DIR=/usr/local/etc/bash_completion.d
    [[ -a $BASH_COMPLETION_DIR/git-completion.bash ]] && source $BASH_COMPLETION_DIR/git-completion.bash
fi

