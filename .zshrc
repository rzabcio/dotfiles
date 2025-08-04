# shellcheck disable=SC1090,SC1091  # allow sourcing files that may not exist
# shellcheck disable=SC2076  # not sure how to approach this, without quoting regex there is syntax error

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# shellcheck disable=SC2296
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	# shellcheck disable=SC2296,SC1090
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.emacs.d/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
hostname="$(hostname)"
function choose_theme {
	if [[ $hostname =~ 'sygnity|corpnet|cpd|c1-|gojira|mrfluence|r2bucket|bamboo' ]]; then
		echo 'rzabcio'
	else
		# echo 'headline'
		# echo 'murilasso'
		# echo 'rzabcio'
		echo 'powerlevel10k/powerlevel10k'
	fi
}
# shellcheck disable=SC2034
ZSH_THEME="$(choose_theme)"

function set_proxy {
	if [[ $hostname =~ 'gojira|mrfluence|signthis|sygnity|corpnet|cpd|c1|r2bucket|bamboo' ]]; then
		echo 'http://proxy.corpnet.inside:8080'
	else
		echo ''
	fi
}
proxy="$(set_proxy)"
export HTTP_PROXY="$proxy"
export HTTPS_PROXY="$proxy"

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
DISABLE_AUTO_TITLE="true"
export DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# shellcheck disable=SC2034  # var not used, because of oh-my-zsh
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
# shellcheck disable=SC2034  # var not used, because of oh-my-zsh
plugins=(
	ansible
	brew
	direnv
	fzf
	fzf-tab
	gcloud
	git
	jj
	kubectl
	pipenv
	python
	sudo
	tmux
	zsh-autosuggestions
)

### fzf-tab
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-k:accept'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
# shellcheck disable=SC2016  # need to use single quotes for zstyle
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
# shellcheck disable=SC2016
zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat ${(Q)realpath}'
# shellcheck disable=SC2016
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'

### Completions
# if command -v tmuxp &> /dev/null; then
# 	eval "$(_TMUXP_COMPLETE=source_zsh tmuxp)"
# fi
if command -v zoxide &> /dev/null; then
	eval "$(zoxide init --cmd cd zsh)"
fi

# Google Cloud
if [ -d "$HOME/google-cloud-sdk" ]; then
	export PATH="$HOME/google-cloud-sdk/bin:$PATH"
	. "$HOME/google-cloud-sdk/path.zsh.inc"
	. "$HOME/google-cloud-sdk/completion.zsh.inc"
fi
if [ -d '/data/data/com.termux/files/usr/google-cloud-sdk' ]; then
	export PATH="/data/data/com.termux/files/usr/google-cloud-sdk/bin:$PATH"
	. '/data/data/com.termux/files/usr/google-cloud-sdk/path.zsh.inc'
	. '/data/data/com.termux/files/usr/google-cloud-sdk/completion.zsh.inc'
fi

eval "$(dircolors ~/.dircolors)";
source "$ZSH/oh-my-zsh.sh"

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


### HISTORY SIZE AND DEFAULT EDITOR
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
if command -v nvim &> /dev/null; then
	export EDITOR=nvim
else
	export EDITOR=vim
fi


### FZF SECTION
if command -v fzf &> /dev/null; then
	export FZF_DEFAULT_COMMAND='fdfind --type f'
	export FZF_DEFAULT_COMMAND='fd --type f -H'
	alias fzfp="fzf --preview \"batcat --style=numbers --color=always --line-range :500 {}\""
	# bindkey -s '^e' '$EDITOR $(fzf)\n'
fi
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:-1,bg:-1,hl:#81a1c1
 --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
 --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
 --color=marker:#eacb8a,spinner:#b48dac,header:#a3be8b'


### AUTO SUGGEST SECTION
# bindkey '^k' autosuggest-fetch
bindkey '^ ' autosuggest-accept


### exports/aliases
export TERM=xterm-256color
export LESS="-F -X $LESS"
export HEADLINE_DO_GIT_STATUS_COUNTS='true'
export BAT_THEME="Nord"
export ZK_NOTEBOOK_DIR="$HOME/vimwiki/default"
#alias tmux="TERM=screen-256color-bce tmux"
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
alias tl="tmuxifier load-session"
# alias wiki="cd ~/vimwiki/default; nvim -c 'VimwikiMakeDiaryNote'; (wikisync &) >/dev/null 2>&1"
# alias wiki="cd ~/vimwiki/default; ls diary/*20* | tail -1 | xargs nvim -c 'e'; (wikisync &) >/dev/null 2>&1"
alias wiki="cd ~/vimwiki/default; nvim README.md; (wikisync &) >/dev/null 2>&1"
zkdump() {
	# shellcheck disable=SC2046,SC2006,SC2012  # not sure about this...
	echo "* #dump $1" >> `ls diary/*20* | tail -n 1`
}
if command -v bat &> /dev/null; then
	alias cat="bat --plain"
fi
if command -v eza &> /dev/null; then
	alias ls="eza --icons --group-directories-first"
fi
alias gw="git worktree"
alias gwls="git worktree list"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Homebrew
if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if command -v thefuck &> /dev/null; then
	eval "$(thefuck --alias)"
fi

### Tmuxifier https://github.com/jimeh/tmuxifier
if [ -d "$HOME/.tmuxifier/bin" ]; then
	export PATH=$HOME/.tmuxifier/bin:$PATH
	eval "$(tmuxifier init -)"
	export TMUXIFIER_LAYOUT_PATH=$HOME/.config/tmuxifier/layouts
fi

### Atlassian SDK
if [ -d "/opt/atlassian-plugin-sdk/bin" ]; then
	export PATH=/opt/atlassian-plugin-sdk/bin:$PATH
fi

### AWS completion
if [ -f '/usr/bin/aws_completer' ]; then
	complete -C '/usr/bin/aws_completer' aws
fi

### Kubectl krew
if [ -d "$HOME/.krew/bin" ]; then
	export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

### JJ completion
if command -v jj &> /dev/null; then
	eval "$(jj util completion zsh)"
fi

## lad local envs
## -- use if no direnv
# function chpwd() {
#   if [ -r $PWD/.env ]; then
#     source $PWD/.env
#   fi
# }
