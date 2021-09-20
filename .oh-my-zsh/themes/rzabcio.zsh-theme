setopt prompt_subst

autoload -U add-zsh-hook
autoload -Uz vcs_info

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:git*' formats " @%b"


add-zsh-hook precmd mikeh_precmd

mikeh_precmd() {
    vcs_info
}

# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: https://bbs.archlinux.org/viewtopic.php?pid=521888#p521888
PROMPT=$'%{\e[0;34m%}%B┌──(%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;30m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B)%b%{\e[0m%}-%b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;36m%}$vcs_info_msg_0_%B]%b%{\e[0m%}%{\e[0;34m%}
%B└─%{\e[1;35m%}$%{\e[0;34m%}%{\e[0m%}%b '
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b 'kk
