_BLUE=$(tput setaf 4)
_GREEN=$(tput setaf 2)
_BOLD=$(tput bold)
_RESET=$(tput sgr0
)
export PS1="${_BOLD}${_BLUE}\W ${_GREEN}\$ ${_RESET}"
