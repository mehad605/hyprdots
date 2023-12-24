#This command changes the path variable from a regular array to an array of unique values. Since the PATH variable and the path variable are linked in zsh, #this command will also remove duplicates from the $PATH
typeset -U path



# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/


HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# options
unsetopt menu_complete
unsetopt flowcontrol

setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

autoload -U compinit 
compinit

bindkey '^d' end-of-line


# theme/plugins

# Path to powerlevel10k theme
source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/alias.zsh
source ~/.zsh/zsh-you-should-use/you-should-use.plugin.zsh
eval "$(starship init zsh)"
[[ -s ~/.zsh/autojump/bin/autojump.sh ]] && . ~/.zsh/autojump/bin/autojump.sh

zstyle ':completion:*' menu select

# history substring search options
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down


ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Set environment variables & path
export CHROME_EXECUTABLE=/usr/bin/brave
# export PATH="$PATH:$HOME/Scripts/flutter/bin"





# List of plugins used
plugins=()

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local pkg="$1"
    if pacman -Si "$pkg" &>/dev/null ; then
        sudo pacman -S "$pkg"
    else 
        "$aurhelper" -S "$pkg"
    fi
}



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Display Pokemon
#pokemon-colorscripts --no-title -r 1,3,6
