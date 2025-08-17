# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin/:$HOME/.cargo/bin:$PATH

alias ghc=ghc-9.10.1
alias discord="http_proxy=socks5://localhost:2080 https_proxy=socks5://localhost:2080 discord"

# Path to your oh-my-zsh installation.
export ZSH="/home/aidin/.oh-my-zsh"
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select
#echo '\e[3 q'

bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
#export LUA_INIT="@/home/aidin/Programming/2nd.lua"
export MANGOHUD=0
export GTK2_RC_FILES=/usr/share/themes/gruvbox-dark-gtk/gtk-2.0/gtkrc
#export GTK_THEME=Gruvbox-Material-Dark
export GTK_THEME=gruvbox-dark-gtk

export QT_QPA_PLATFORMTHEME=qt5ct

#add awesome libraries to LUA PATH
export LUA_PATH="/usr/local/lib/lua/5.4/?.lua;/usr/local/lib/lua/5.4/?/?.lua;/usr/share/?/?.lua;/usr/share/?/?/?.lua/usr/share/lua/5.4/?/init.lua;/usr/lib/lua/5.4/?.lua;/usr/lib/lua/5.4/?/init.lua;/usr/share/lua/5.4/?.lua;/usr/share/awesome/lib/?/init.lua;/usr/share/awesome/lib/?/?.lua;/usr/share/awesome/lib/?.lua;/usr/lib/luarocks/rocks-3.4/?/init.lua;;"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#COMMENTED TO ADD DESIRED THEME :D
ZSH_THEME="m3-round"

# ADDED IT MYSELF! BECAUSE OF THE ERROR ZSH GAVE: hostname command not found!
alias hostname="echo $HOST"

#For changing default graphics card to nvidia
alias swnvidia="prime-offload;optimus-manager --switch nvidia"

#To fix fonts after startup
alias fixfont="cp ./.config/polybar/fonts/siji.pcf /usr/share/fonts/siji.pcf; fc-cache -f -v"

alias stbluetooth="sudo systemctl restart bluetooth.service; pactl load-module module-bluetooth-discover; bluetoothctl"
alias encore="~/.encore/bin/encore"
#To fix the library issues
#alias LD_LIBRARY_PATH="/usr/local/lib"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#CUSTOM CODE :D
#ZSH_THEME="af-magic"

[ -f "/home/aidin/.ghcup/env" ] && . "/home/aidin/.ghcup/env" # ghcup-env

# pnpm
export PNPM_HOME="/home/aidin/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
