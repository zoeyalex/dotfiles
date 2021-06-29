#
# ~/.zshrc
#

### Init
setopt autocd		# Automatically cd into typed directory.
unsetopt beep       # Disable beep
stty stop undef		# Disable ctrl-s to freeze terminal.

### Prompt %{$type[color]%} where type = fg/bg and color = red/green/blue/...
autoload -U colors && colors	# Load colors
#PS1='%{$fg[yellow]%}[%{$fg[magenta]%}%n%{$fg[white]%}@%{$fg[blue]%}%M %{$fg[white]%}%c$(git_branch_name)%{$fg[yellow]%}]%{$reset_color%}$ '
PS1='%{$fg[blue]%}%c $(git_branch_name) >> %{$reset_color%}'
setopt prompt_subst


### History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

### End of lines configured by zsh-newuser-install
### The following lines were added by compinstall
zstyle :compinstall filename '/home/zoey/.zshrc'

### Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

### Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


### Aliases
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias m='python ~/curses-file-manager/src/__init__.py'
alias c='clear'                           # clears the display
alias cp='cp -ivr'                        # confirm before overwriting something
alias diff='diff --color=auto'		      # add colors
alias ls='ls -h --color=auto'		      # human-readable sizes
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias rm='rm -I'			              # prompt once before removing
alias f='ranger'			              # file browser
alias web='firefox --new-window /home/zoey/PastelCove/src/index.html'
alias reboot='doas reboot'
alias poweroff='doas poweroff'
alias emerge='doas emerge'
alias emacs='emacs --no-splash'
alias ping='ping -c 3 gnu.org'
alias neofetch='neofetch --source ~/cat.txt'
alias mocp='mocp -T /usr/share/moc/themes/black_theme'
export PATH="$HOME/.local/bin:$PATH"      # add /.local/bin to path
export PATH=~/.emacs.d/bin:$PATH
export PATH=~/.local/bin/status:$PATH


### Scripts
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

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | grep -o  "\/[a-zA-z0-9_.-]*$" | cut -b 2-)
  if [[ $branch != "" ]];
  then
    echo " ($branch)"
  fi
}


### Syntax highlight
# Enable and tweak syntax highlighting
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[path]=none                                   # Remove directory underline
#ZSH_HIGHLIGHT_STYLES[path_prefix]=none                            #
#ZSH_HIGHLIGHT_STYLES[precommand]=fg=cyan                          # Remove precommand underline
#ZSH_HIGHLIGHT_STYLES[unknown-token]=none                          # Remove error color


#ZSH_HIGHLIGHT_STYLES[builtin]=fg=cyan                             # builtin commands (pwd)
#ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan                       # shell reserved words (if, for)
#ZSH_HIGHLIGHT_STYLES[command]=fg=cyan

ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009
ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=magenta
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=009
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=magenta
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

