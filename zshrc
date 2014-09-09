#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export EDITOR='vim'
export VISUAL=$EDITOR
export JAVA_HOME=~/Tools/jdk1.7.0_60

export LOCAL_MAVEN=/home/zhouhua/Work/polyvirtual/cloudy/release/main/Maven
export M2=$LOCAL_MAVEN/apache-maven-3.2.1/bin
export M2_HOME=$LOCAL_MAVEN/apache-maven-3.2.1
export M2_REPO=$LOCAL_MAVEN/repository

export PATH=$PATH:$M2

# Fix the fucking color scheme problem while vim inside tmux
alias tmux="TERM=screen-256color-bce tmux"
source ~/.svnrc
source ~/.tmuxinator.zsh

export GOROOT=/usr/lib/go
export GOPATH=~/.gopath

export PATH=$GOPATH/bin:$JAVA_HOME/bin:$PATH

function cfiles {
    find -regextype posix-egrep -regex '.*\.h$|.*\.hpp$|.*\.c$|.*\.cpp|.*\.cc$'
}

function cppgrep {
   2>/dev/null cgrep --identifier "$@" $(cfiles) | nl | grep "$@"
}

function cppgreps {
   2>/dev/null cgrep --string "$@" $(cfiles) | nl | grep "$@"
}

function hfiles {
    find -regextype posix-egrep -regex '.*\.h|.*\.hpp'
}

function hgrep {
    2>/dev/null cgrep --identifier "$@" $(hfiles) | nl | grep "$@"
}

function yank {
    grep "^\s*$@\s" | awk '{print $2}' | sed 's/-\([0-9]*\)-/:\1:/g' | awk -F: '{print $1 " +" $2}' | awk '{print $2 " " $1}' | xargs ${EDITOR:?EDITOR must be set.}
}
