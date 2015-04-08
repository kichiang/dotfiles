# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup nice colors
alias sudo='sudo '
[[ $OSTYPE == *linux* ]] && alias ls='ls --color=auto'
[[ $OSTYPE == *darwin* ]] && alias ls='ls -G'
alias grep='grep --color=auto'
alias diff='colordiff'

# Generate the databases of cscope and ctags
gentag() {
    GT_OPT=""
    if [ $# == 1 ] && [ "$1" == "-L" ]; then
        GT_OPT="-L"
    fi
    rm -f /tmp/cscope.files
    echo -ne "[ .... ] Create list of files in system\r"
    find $GT_OPT $PWD -name '*.[ch]' | awk '{print "\""$0"\""}' > /tmp/cscope.files
    find $GT_OPT $PWD -name '*.cpp' -o -name '*.cxx' | awk '{print "\""$0"\""}' >> /tmp/cscope.files
    echo "[ Done ] Create list of files in system"
    rm -f $PWD/cscope.out $PWD/cscope.*.out $PWD/tags $PWD/gentag.log
    echo -ne "[ .... ] Generate cross-reference database\r"
    cscope -bqki /tmp/cscope.files > $PWD/gentag.log 2>&1
    ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q $PWD >> $PWD/gentag.log 2>&1
    if [ ! -s $PWD/gentag.log ]; then
        rm $PWD/gentag.log
        echo "[ Done ] Generate cross-reference database"
    else
        rm -f $PWD/cscope.out $PWD/cscope.*.out $PWD/tags
        echo "[ Fail ] Generate cross-reference database"
    fi
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

