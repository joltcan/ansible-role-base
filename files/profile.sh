#
## This file is managed by ansible
#

# use bash completion
if [ -f /etc/bash_completion ]
then
    . /etc/bash_completion
fi

# Sane defaults for inputrc
if [ ! -f ~/.inputrc ]
then
    echo "set bell-style none" >> ~/.inputrc
    echo "set completion-ignore-case on" >> ~/.inputrc
fi

# common aliases
alias l='ls -lah'
alias rp='rsync -avP'
alias vi='vim'
alias upgrade='apt update && apt -y upgrade'
