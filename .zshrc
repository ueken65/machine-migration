autoload -U colors
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '%{'${fg[cyan]}'%}[%s %b] %{'$reset_color'%}'


setopt prompt_subst
precmd () {
  LANG=en_US.UTF-8 vcs_info
  PROMPT='${vcs_info_msg_0_}%{${fg[yellow]}%}%*%{$reset_color%} %{${fg[green]}%}%~%{$reset_color%}
$ '
}

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^r' peco-history-selection

## history
setopt APPEND_HISTORY

## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zsh-history # 履歴をファイルに保存する
HISTSIZE=100000 # メモリ内の履歴の数
SAVEHIST=100000 # 保存される履歴の数

alias ll='ls -la'
alias gb='git branch'
alias ga='git add'
alias gc='git commit --no-verify'
alias gco='git checkout'
alias gcho='git checkout'
alias gcob='git checkout -b'
alias gs='git status'
alias gst='git status'
alias gcm='git checkout master'
alias gpom='git pull origin master'
alias gmm='git merge master'
alias gd='git branch -d'

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

export EDITOR=vim
eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/{YOUR_MACHINE_NAME}}/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/{YOUR_MACHINE_NAME}}/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/{YOUR_MACHINE_NAME}}/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/{YOUR_MACHINE_NAME}}/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export GOPATH=$HOME/go

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/opt/mysql-client@5.7/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/{YOUR_MACHINE_NAME}}/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/{YOUR_MACHINE_NAME}}/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/{YOUR_MACHINE_NAME}}/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/{YOUR_MACHINE_NAME}}/google-cloud-sdk/completion.zsh.inc'; fi
