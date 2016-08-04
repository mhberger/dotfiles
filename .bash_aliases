alias agd='sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias ags='apt-cache search'
alias agsh='apt-cache show'
alias agu='sudo apt-get update'
alias b2d='boot2docker'
alias b2dinit='$(boot2docker shellinit)'
alias calm='cal -m'
alias caly='cal -y'
alias cut80='cut -c 1-80'
alias diffo='diff -y --suppress-common-lines'
alias diffow='diff -W250 -y --suppress-common-lines'
alias dos2unix="tr -d '\r'"
alias dush='du -hs .[^.]* *'

alias dt="date +%Y-%m-%d"
alias ts="date +%Y%m%d_%H%M%S"
alias dtc="date +%Y%m%d"

alias ga='git add'
alias gai='git add --interactive'
alias gap='git add --patch'
alias gau='git add --update'
alias gb='git branch'
alias gbl='git branch -a'
alias gca='git commit -a -m'
alias gcm='git commit --reset-author -c'
alias gcmh='git commit --reset-author -c HEAD'
alias gd='git diff -w'
alias gdc='git diff -w --cached'
alias gdh='git diff -w HEAD~1 HEAD'
alias gdns='git diff --name-status'
alias gdnss='git diff --stat --color'
alias gf='git show --pretty="format:" --name-only'
alias gg='git grep'
alias gh='git help'
alias gitunadd='git reset --mixed'
alias gituncommit='git reset --soft'
alias gitundo='git reset --hard'
alias gl='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias gla='gl --all'
alias glg="git log --graph --decorate --pretty='%C(yellow)%h%Creset %an %s (%ar)'"
alias glg='git log --graph --abbrev-commit --pretty=oneline'
alias glgg='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias glh='gl | head'
alias glhn='gl | head -n'
alias glreverse='git log --reverse --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias gls='git ls-files -s'
alias gls='git ls-files'
alias grv='git remote -v'
alias gs='git status'
alias gsb='git show-branch master git-svn'
alias gsba='git show-branch -a'
alias gsbs='git show-branch master svn/trunk'
alias gsd='git svn dcommit'
alias gsh='git show --name-status --oneline'
alias gsr='git svn rebase'

alias jb='jbake'
alias jbb='jbake -b'
alias jj='jbb && rm output/2*.html && ./splitfile.sh'

alias ll='ls -altr'
alias lld="ls -altr | grep ^d"
alias llf="ls -altr | grep -v ^d"
alias ls='ls --color=auto'
alias ls='ls -G'

alias uniqc='sort | uniq -c'

alias lower='tr  "[:upper:]" "[:lower:]"'
alias upper='tr  "[:lower:]" "[:upper:]"'
alias hd='hexdump -C'

alias psa="ps -aux"
alias nets='netstat -nr | less'
alias routes='netstat -nr | less'
alias hosts="grep -v '^#' /etc/hosts"

alias sha1="openssl sha1"
alias sha256="openssl sha256"

alias tma='tmux attach -t'
alias tmls='tmux ls'

alias ~alias='vi ~/.bash_aliases && . ~/.bash_aliases'

export GIT_AUTHOR_EMAIL=mark.berger@moothall.nz
export GIT_AUTHOR_NAME='Mark Berger'
export GIT_COMMITTER_EMAIL=mark.berger@moothall.nz
export GIT_COMMITTER_NAME='Mark Berger'

ff ()
{
  if [ -z "$1" ] ; then find . -type f | grep -v svn; return; fi
  find $1 -type f | grep -v svn
}

function  st() { echo "setting title to [${@}]"; export PROMPT_COMMAND='echo -ne "\033]0;'$@'\007"'; }
