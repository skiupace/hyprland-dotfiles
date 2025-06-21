# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


# Load completions
autoload -U compinit && compinit

zinit cdreplay -q


# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# User-define aliases
alias query="pacman -Si"
alias install="doas pacman -S"
alias remove="sudo pacman -R"
alias remove-all="sudo pacman -Rcs"
alias upgrade="doas pacman -Syu"

alias ls="lsd"
alias l="lsd -lah"
alias ll="lsd -l"
alias rm="trash -v"

alias hypr-config="nvim ~/.config/hypr/hyprland.conf"
alias waybar-config="nvim ~/.config/waybar/config"
alias waybar-style="nvim ~/.config/waybar/style.css"

alias timeshift-gtk="doas timeshift-gtk"
alias gparted="doas gparted"

alias mount-m2-ssd="doas mount /dev/sdb1 /mnt/m2-ssd"
alias unmount-m2-ssd="doas umount /dev/sdb1"

alias mount-external-hdd="doas ntfsfix --no-action /dev/sdc2 && doas mount -t ntfs3 /dev/sdc2 /mnt/external-hdd"
alias unmount-external-hdd="doas umount -t ntfs3 /dev/sdc2"

alias yt-audio='yt-dlp --extract-audio --add-metadata --xattrs --embed-thumbnail --audio-quality 0 --audio-format mp3' # youtube-dl
alias yt-video='yt-dlp --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --embed-thumbnail --add-metadata'


# Shell integrations
# eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"


#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#  tmux attach-session -t default || tmux new-session -s default
#fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/home/ahmed47/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# laravel
export PATH=~/.config/composer/vendor/bin:$PATH

export PATH="$PATH:/home/ahmed47/.local/bin"

. "$HOME/.local/bin/env"

PATH=~/.console-ninja/.bin:$PATH
