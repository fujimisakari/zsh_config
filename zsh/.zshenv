
###;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
###  Enviroment Setting
###;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

case "${OSTYPE}" in
  linux*)
    PATH=${HOME}/dotfiles/bin:${PATH}:/sbin:/usr/sbin
  ;;
  darwin*)
    export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
    PATH=/usr/local/opt/coreutils/libexec/gnubin:${HOME}/dotfiles/bin:/usr/local/bin:/sbin:/usr/sbin:${PATH}
  ;;
esac

## Python
export PYTHONDONTWRITEBYTECODE=1  # pycは作らない
export WERKZEUG_DEBUG_PIN='off'   # for Django-extentions

if [[ -e "${HOME}/.pyenv" ]]; then
  export PYENV_ROOT=${HOME}/.pyenv
  PATH=${PYENV_ROOT}/bin:${PATH}
  eval "$(pyenv init -)"
fi

## PHP
if [[ -e "${HOME}/.phpenv" ]]; then
  PATH=${HOME}/.phpenv/bin:${PATH}
  eval "$(phpenv init -)"
fi

## Ruby
if [[ -e "${HOME}/.rbenv" ]]; then
  PATH=${HOME}/.rbenv/bin:${PATH}
  eval "$(rbenv init -)"
fi

## node.js
if [[ -e "${HOME}/.nodenv" ]]; then
  PATH=${HOME}/.nodenv/bin:${PATH}
  eval "$(nodenv init -)"
fi

## Go
if [[ -s "${HOME}/projects/merpay/go" ]]; then
  export GOPATH=${HOME}/projects/merpay/go
  PATH=/usr/local/opt/go/libexec/bin:${HOME}/dev/go/bin:${PATH}
fi

if [[ -e "${HOME}/.goenv" ]]; then
  export PATH=${HOME}/.goenv/bin:${PATH}
  eval "$(goenv init -)"
fi

## direnv
if which direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

## Common Lisp
if [[ -e "${HOME}/.roswell" ]]; then
  PATH=${HOME}/.roswell/bin:${PATH}
fi

## Elixir
if [[ -e "${HOME}/.exenv" ]]; then
  PATH=${HOME}/.exenv/bin:${PATH}
  eval "$(exenv init -)"
fi

## カラー設定
if [ -e "${HOME}/.dircolors" ]; then
  if type dircolors > /dev/null 2>&1; then
    eval "$(dircolors ~/.dircolors)"
  elif type gdircolors > /dev/null 2>&1; then
    eval "$(gdircolors ~/.dircolors)"
  fi
fi

## screen セッション保存Dir
export SCREENDIR=${HOME}/.screens

## screeninator
[[ -e "${HOME}/.screeninator/screeninator" ]] && source ${HOME}/.screeninator/screeninator

## HOMEBREW CASKのインストール先
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

## エディタの指定
export EDITOR='vim'

## PAGER設定
if [ -x /usr/bin/lv ]; then
  export PAGER='lv'
fi

## ロケール設定
export LANG='ja_JP.UTF-8'
export LC_ALL="${LANG}"

## 補完リストが多いときに尋ねる数
## -1 : 尋ねない
##  0 : ウィンドウから溢れるときは尋ねる
export LISTMAX=0
