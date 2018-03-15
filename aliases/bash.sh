
alias postman='chrome --app-id=fhbjgbiflinjbdggehcddcbncdddomop'
alias home='cd ~'
alias repos='cd ~/Documents/GitHub/'

alias g='git'
alias gui='git-gui'
alias log-pretty='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cgreen\\ [%cn]" --decorate --date=relative -20'

# open on browser the remote repository
alias gh='start https://github.$(git config remote.origin.url | cut -f2 -d. | tr ":" /)'

alias sb='subl .'
alias exp='explorer .'