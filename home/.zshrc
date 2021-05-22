#
# ~/.zshrc
#

# Init
setopt autocd		# Automatically cd into typed directory.
unsetopt beep       # Disable beep
stty stop undef		# Disable ctrl-s to freeze terminal.

# PS1
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/zoey/.zshrc'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Aliases
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias m='python ~/curses-file-manager/src/__init__.py'
alias p='sudo pacman'                     # convenience
alias c='clear'                           # clears the display
alias cp='cp -ivr'                        # confirm before overwriting something
alias diff='diff --color=auto'		      # add colors
alias ls='ls -h --color=auto'		      # human-readable sizes
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias rm='rm -I'			              # prompt once before removing
alias f='pcmanfm'			              # gui file browser
alias md='ghostwriter'                    # markdown editor
alias web='firefox --new-window /home/zoey/PastelCove/src/index.html'
export PATH="$HOME/.local/bin:$PATH"      # add /.local/bin to path

# Lets you search for files and open them with vim | uses fzf
v ()
{
  if [ -z $1 ]
  then
	  return
  fi

  file=$(locate $1 | fzf)

  if [ -z $file ]
  then
	  return
  fi
  vim $file
}

# Enable and tweak syntax highlighting
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES #
ZSH_HIGHLIGHT_STYLES[path]=none                                   # remove directory underline
ZSH_HIGHLIGHT_STYLES[path_prefix]=none                            #
