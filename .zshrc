export TERM="xterm-256color"

. ~/.common.rc.sh
. ~/.zsh_completion

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd nomatch
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install

bindkey '\e[7~' beginning-of-line
bindkey '\e[8~' end-of-line

ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="alanpeabody"
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="awesome-patched"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs custom_nixshell)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
DIRCOLOR="007"
POWERLEVEL9K_DIR_HOME_BACKGROUND=$DIRCOLOR
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$DIRCOLOR
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=$DIRCOLOR
POWERLEVEL9K_CUSTOM_NIXSHELL="echo ${NIXSHELL}"
POWERLEVEL9K_CUSTOM_NIXSHELL_BACKGROUND="006"
POWERLEVEL9K_TIME_BACKGROUND="010"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
plugins=(git)
source $ZSH/oh-my-zsh.sh

