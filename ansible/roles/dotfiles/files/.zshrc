# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF

# 日本語を使用
export LANG=ja_JP.UTF-8

# 色を使用
autoload -Uz colors
colors

# 補完
fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit
compinit

# emacsキーバインド
bindkey -e

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# 自動でpushdを実行
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups

# コマンドミスを修正
setopt correct

# Functions
function set-aws-profile() {
	local aws_profiles
	aws_profiles=$(grep "^\["  ~/.aws/config | tr -d "\[|\]" | sed 's/profile //')
	if [ -z "$aws_profiles" ]; then return 1; fi
	export AWS_PROFILE=$(echo $aws_profiles | fzf --height 8% --reverse --prompt="Select AWS profile: ")
	if [[ -n $AWS_PROFILE ]]; then echo "[INFO] aws profile has been set to \"$AWS_PROFILE\"."; fi
}

# export paths
export PATH=$HOME/.nodebrew/current/bin:$HOME/.local/bin:$PATH
export GOPATH=$HOME/go

# foundamental alias
alias vi='vim'
alias g=git
alias dc=docker-compose

# git config
git config --global alias.pl pull; \
git config --global alias.b branch; \
git config --global alias.p push; \
git config --global alias.ch checkout; \
git config --global alias.m "merge --no-ff --no-edit"; \
git config --global alias.c "commit"; \
git config --global alias.l "log --graph --decorate"; \
git config --global alias.st "status -s"; \
git config --global alias.pick "cherry-pick -n";
git config --global alias.sr "symbolic-ref --short HEAD"
git config --global pull.rebase false

# init ssh setting
echo 'Adding ssh keys...'
eval "$(ssh-agent -s)" >/dev/null
ssh-add -K ~/.ssh/github/id_rsa >/dev/null 2>&1

# init pyenv
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# zsh prompt settings
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

alias rm='rm -f'
alias ll='ls -lah'

# Manual completions
source ~/.yarn-completion/yarn-completion.plugin.zsh

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($HOME'/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/tfenv/2.0.0/versions/0.14.2/terraform terraform
