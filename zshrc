# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode history history-substring-search pip tmux command-not-found colored-man-pages man archlinux)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/.bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR='vim'
#export JAVA_HOME=~/Tools/jdk1.7.0_60

#export LOCAL_MAVEN=/home/zhouhua/Work/polyvirtual/cloudy/release/main/Maven
#export M2=$LOCAL_MAVEN/apache-maven-3.2.1/bin
#export M2_HOME=$LOCAL_MAVEN/apache-maven-3.2.1
#export M2_REPO=$LOCAL_MAVEN/repository

#export PATH=$PATH:$M2

# Fix the fucking color scheme problem while vim inside tmux
# alias tmux="TERM=screen-256color-bce tmux"
# source ~/.svnrc
# source ~/.tmuxinator.zsh

#export GOROOT=/usr/lib/go
export GOPATH=~/golang

export PATH=$GOPATH/bin:$PATH

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

# Base16 Shell
BASE16_SHELL="$HOME/config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# load dircolors
[ -s "$HOME/.dircolors" ] && eval `dircolors $HOME/.dircolors`

alias gp4="git-p4"
