#Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh
# if you want to use this, change your non-ascii font to Droid Sans Mono for Awesome

#export POWERLEVEL9K_MODE='nerdfont-complete'
export ZSH_THEME="powerlevel10k/powerlevel10k"

# export ZSH_THEME="agnoster"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# https://github.com/bhilburn/powerlevel9k#customizing-prompt-segments
# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt




POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs go_version)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_dotnet root_indicator background_jobs history)
POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND=(red1 orangered1 darkorange orange1 gold1 yellow1 yellow2 greenyellow chartreuse1 chartreuse2 green1)

POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="gray"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="yellow"

zsh_wifi_signal(){
        local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
        local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

        if [ "$airport" = "Off" ]; then
                local color='%F{yellow}'
                echo -n "%{$color%}Wifi Off"
        else
                local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
                local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
                local color='%F{yellow}'

                [[ $speed -gt 100 ]] && color='%F{green}'
                [[ $speed -lt 50 ]] && color='%F{red}'

                echo -n "%{$color%} $speed Mb/s%{%f%}" # removed char not in my PowerLine font
        fi
}
POWERLEVEL9K_CUSTOM_DOTNET="zsh_dotnet"
POWERLEVEL9K_CUSTOM_DOTNET_BACKGROUND="gray"
POWERLEVEL9K_CUSTOM_DOTNET_FOREGROUND="yellow"

zsh_dotnet(){

  #  [[ -f project.json || -f global.json || -f paket.dependencies || -n *.(cs|fs|x)proj(#qN^/) || -n *.sln(#qN^/) ]]

    local dotnet_version=$(dotnet --version 2>/dev/null)

    echo -n  '.NET:':$dotnet_version
}


# colorcode test
# for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
POWERLEVEL9K_NVM_FOREGROUND='000'
POWERLEVEL9K_NVM_BACKGROUND='072'
POWERLEVEL9K_SHOW_CHANGESET=true
#export ZSH_THEME="random"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# disable colors in ls
# export DISABLE_LS_COLORS="true"

# disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.dotfiles/oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  zsh-autosuggestions
  colorize
  compleat
  dirpersist
  autojump
  git
  gulp
  history
  docker
  kubectl
  cp)

source $ZSH/oh-my-zsh.sh

source /usr/local/opt/nvm/nvm.sh

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use &> /dev/null
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    nvm use default &> /dev/null
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Customize to your needs...
unsetopt correct

# run fortune on new terminal :)
# fortune

source $(brew --prefix nvm)/nvm.sh

#export PROMPT="$PROMPT\$(git-radar --zsh --fetch) "

#source $ZSH/custom/themes/powerlevel9k/powerlevel9k.zsh-theme

#source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source $HOME/.iterm2_shell_integration.zsh


function iterm2_print_user_vars() {
  iterm2_set_user_var k8sContext $(kubectl config current-context)
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ahankendi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ahankendi/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ahankendi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ahankendi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
source $ZSH/themes/powerlevel10k/powerlevel10k.zsh-theme
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
zplugin light jonmosco/kube-ps1
PROMPT='$(kube_ps1)'$PROMPT
