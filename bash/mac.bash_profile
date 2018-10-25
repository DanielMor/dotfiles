if [[ $PATH != *".npm-global/bin"* ]]; then
  export PATH=~/.npm-global/bin:$PATH
fi

if [[ $PATH != *"/repos/bin"* ]]; then
  export PATH=~/repos/bin:$PATH
fi

source /usr/local/git/contrib/completion/git-completion.bash
source /usr/local/git/contrib/completion/git-prompt.sh

PS1="\[\033[32m\]\u@\h \[\033[93m\]\w\[\033[36m\]\$(__git_ps1)\[\033[00m\]\n$ "

alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias home='cd ~'
alias repos='cd ~/repos/'
alias folder='open .'
alias sb='sublime .'
alias ll='ls -l'

alias edit='sublime ~/.bash_profile'
alias load='source ~/.bash_profile'
alias postman='open -a Postman'

alias g='git'
alias gui='git gui'
alias gl='git log --graph --pretty=format:"%C(blue)%h%C(reset) - %C(bold yellow)(%ad) - %Creset%s%Cgreen - [%cn] - %Cred%d" --decorate --date=relative -20'
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gl-adog='git log --all --decorate --oneline --graph'

#alias postman='chrome --app-id=fhbjgbiflinjbdggehcddcbncdddomop'

# open on browser the remote repository (windows)
#alias github='open https://github.$(git config remote.origin.url | cut -f2 -d. | tr ":" /)'
#alias gh='open https://$(git config remote.origin.url | cut -f2 -d@ | tr ":" /)'

# macOS/Unix
#alias gh='open https://github.$(git config remote.origin.url | cut -f2 -d. | tr ":" /)'

d-clean() {
  docker rm -f $(docker ps --filter "status=exited" -q)
  docker rmi -f $(docker images -f "dangling=true" -q)
  docker volume rm $(docker volume ls -qf dangling=true)
}

d-bash () {
  docker exec -it $1 bash
}

#new way to clean docker
alias d-prune='docker system prune -a --volumes'

alias d-ps='docker ps'
alias d-psa='docker ps -a'
alias d-log='docker logs'
alias d-logf='docker logs -f'

alias dc-up='docker-compose up -d'
alias dc-stop='docker-compose stop'
alias dc-build='docker-compose build'
alias dc-start='dc-build && dc-up'
alias dc-down='docker-compose down'

alias s='npm start'
alias nis='npm install --save '
alias nid='npm install --save-dev '
alias dev='npm run dev'
alias tests='npm test -- --watch --coverage'
alias hs='history | grep'

alias commands='repos && cd bin'
alias talk='cat - | while read cat; do say $cat; done'
alias javascript='repos; cd tests; sb .'
alias branch-clean='git branch --merged | grep -v '\*\|master\|develop' | xargs -n 1 git branch -d'

mkcd() {
  mkdir $1
  cd $1
}

to() {
  repos
  folders=$(echo *$1*/)
  cd $OLDPWD

  select dir in $folders
  do
    LAST_TO=$ACTUAL_TO
    ACTUAL_TO=$dir
    cd ~/repos/$dir
    break
  done
}

alias to-='cd -'
alias gapps='git gapps'

# For completion on git alias
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \ || complete -o default -o nospace -F _git g

