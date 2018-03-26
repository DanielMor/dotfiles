
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias home='cd ~'
alias repos='cd ~/Documents/GitHub/'
alias exp='explorer .'
alias sb='subl .'
alias edit='subl'

alias g='git'
alias gui='git-gui'
alias log-pretty='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cgreen\\ [%cn]" --decorate --date=relative -20'

alias postman='chrome --app-id=fhbjgbiflinjbdggehcddcbncdddomop'

# open on browser the remote repository (windows)
alias gh='start https://github.$(git config remote.origin.url | cut -f2 -d. | tr ":" /)'
# macOS/Unix
#alias gh='open https://github.$(git config remote.origin.url | cut -f2 -d. | tr ":" /)'

docker-clean() {
  docker rm -f $(docker ps --filter "status=exited" -q)
  docker rmi -f $(docker images -f "dangling=true" -q)
  docker volume rm $(docker volume ls -qf dangling=true)
}

#new way to clean docker
alias docker-prune="docker system prune -a --volumes"
