# 
# Sal Olivares (0x102c)
# http://sal.codes
#
# My zsh config leveraging oh-my-zsh
#

### Exports
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"                      # getting proper colors

# SET MANPAGER
# Uncomment only one of these!

# "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"


### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi


### Themes
ZSH_THEME="nanotech"
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
  eval "$("$BASE16_SHELL/profile_helper.sh")"

### OS Dependent settings
case `uname` in
  Darwin)
    # commands for OS X go here
    plugins=(
      git osx zsh-syntax-highlighting autojump zsh-interactive-cd
    )
 
    ## Set up iterm2 shell integration
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

    ;;
  Linux)
    # commands for Linux go here
    plugins=(
      git ubuntu zsh-syntax-highlighting autojump zsh-interactive-cd
    )

    ;;
esac

# Sourcing oh-my-zsh
# Your plugins will not work without this source.
source $ZSH/oh-my-zsh.sh

### Aliases
alias gs="git status"

# navigation
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}


# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

## NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

