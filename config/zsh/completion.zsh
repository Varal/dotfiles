### Commands
zmodload zsh/complist
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

_comp_options+=(globdots) # With hidden files


### Options
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.


### Zstyles

# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# Cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Allow you to select in a menu
zstyle ':completion:*' menu select

# Completion notification colors
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''
# zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# Case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Work with sudo
zstyle ':completion::complete:*' gain-privileges 1


### Specific completions

# AWS cli
complete -C '/usr/local/bin/aws_completer' aws

# Docker
source $ZDOTDIR/plugins/docker-completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# flux
source <(flux completion zsh)

# gcloud CLI
source /usr/share/google-cloud-sdk/completion.zsh.inc
zstyle ':completion:*:*:flux:*' list-grouped false

# Helm
source <(helm completion zsh)
zstyle ':completion:*:*:helm:*' list-grouped false

# Kubernetes
source <(kubectl completion zsh)
zstyle ':completion:*:*:kubectl:*' list-grouped false

# Telepresence
source <(telepresence completion zsh)
zstyle ':completion:*:*:telepresence:*' list-grouped false

# Terraform
complete -o nospace -C /opt/homebrew/bin/terraform terraform
zstyle ':completion:*:*:telepresence:*' list-grouped false

# Terragrunt
complete -o nospace -C /opt/homebrew/bin/terragrunt terragrunt
zstyle ':completion:*:*:telepresence:*' list-grouped false