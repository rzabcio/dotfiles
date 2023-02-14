# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
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
	if [[ $hostname =~ 'sygnity|corpnet|cpd|gojira|mrfluence|r2bucket|bamboo' ]]; then
		echo 'rzabcio'
	else
		# echo 'headline'
		# echo 'murilasso'
		# echo 'rzabcio'
		echo 'powerlevel10k/powerlevel10k'
	fi
}
ZSH_THEME="$(choose_theme)"

function set_proxy {
	if [[ $hostname =~ "gojira|mrfluence|signthis" ]]; then
		echo 'http://proxy-dmz.corpnet.inside:8080'
	elif [[ $hostname =~ "sygnity|corpnet|cpd|r2bucket|bamboo" ]]; then
		echo 'http://proxy.corpnet.inside:8080'
	else
		echo ''
	fi
}
export HTTP_PROXY="$(set_proxy)"
export HTTPS_PROXY="$(set_proxy)"

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
plugins=(
	ansible
	brew
	docker
	fzf
	fzf-tab
	gcloud
	git
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
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat ${(Q)realpath}'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'

### Completions
# if command -v tmuxp &> /dev/null; then
# 	eval "$(_TMUXP_COMPLETE=source_zsh tmuxp)"
# fi
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi
if [ -f '/data/data/com.termux/files/usr/google-cloud-sdk/path.bash.inc' ]; then . '/data/data/com.termux/files/usr/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/data/data/com.termux/files/usr/google-cloud-sdk/completion.bash.inc' ]; then . '/data/data/com.termux/files/usr/google-cloud-sdk/completion.bash.inc'; fi

eval "$(dircolors ~/.dircolors)";
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
	bindkey -s '^e' '$EDITOR $(fzf)\n'
fi
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:-1,bg:-1,hl:#81a1c1
 --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
 --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
 --color=marker:#eacb8a,spinner:#b48dac,header:#a3be8b'


### AUTO SUGGEST SECTION
# bindkey '^k' autosuggest-fetch
bindkey '^k' autosuggest-accept


### exports/aliases
export TERM=xterm-256color
export LESS="-F -X $LESS"
export HEADLINE_DO_GIT_STATUS_COUNTS='true'
export BAT_THEME="Nord"
#alias tmux="TERM=screen-256color-bce tmux"
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
alias tl="tmuxp load"
alias wiki="cd ~/vimwiki; nvim -c VimwikiIndex"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Homebrew
if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if command -v thefuck &> /dev/null; then
	eval $(thefuck --alias)
fi
