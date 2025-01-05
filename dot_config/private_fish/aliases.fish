# Clear screen
alias cl clear

# Pacman with color
alias p 'sudo pacman --color auto'

# Navigation shortcuts
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# Convenience aliases
alias exa eza
alias fm yazi

# Zoxide for faster directory navigation
alias cd z

# Edit Configs
alias ea 'nvim ~/.config/fish/aliases.fish'
alias ef 'nvim ~/.config/fish/config.fish'

# Vim and Emacs
alias v nvim
alias em '/usr/bin/emacs -nw'
alias emacs "emacsclient -c -a 'emacs'"
alias doomsync "~/.config/emacs/bin/doom sync"
alias doomdoctor "~/.config/emacs/bin/doom doctor"
alias doomupgrade "~/.config/emacs/bin/doom upgrade"
alias doompurge "~/.config/emacs/bin/doom purge"

# Changing "ls" to "exa"
alias ls 'eza -a1 --color=always --group-directories-first' # my preferred listing
alias la 'eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll 'eza -l --color=always --group-directories-first --icons' # long format
alias lt 'eza -aT --color=always --group-directories-first' # tree listing
alias l. 'eza -a | egrep "^\."'
alias cls 'clear && ls'
alias cll 'clear && ll'

# Changing cat to bat
alias cat bat

# Pacman and yay
alias pacsyu 'sudo powerpill -Syu' # update only standard pkgs
alias pacsyyu 'sudo powerpill -Syyu' # Refresh pkglist & update standard pkgs
alias parsua 'paru -Sua --noconfirm' # update only AUR pkgs (paru)
alias parsyu 'paru -Syu --noconfirm' # update standard pkgs and AUR pkgs (paru)
alias unlock 'sudo rm /var/lib/pacman/db.lck' # remove pacman lock
alias cleanup 'sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages
alias update 'rate-mirrors arch && sudo pacman -Sy && sudo powerpill -Su && paru -Su'

# Confirm before overwriting
alias cp "cp -i"
alias mv 'mv -i'
alias rm 'rm -i'

# Adding flags
alias df 'df -h' # human-readable sizes
alias free 'free -mt' # show sizes in MB

# ps
alias psa "ps auxf"
alias psgrep "ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem 'ps auxf | sort -nr -k 4'
alias pscpu 'ps auxf | sort -nr -k 3'

# btrfs aliases
alias btrfsfs "sudo btrfs filesystem df /"
alias btrfsli "sudo btrfs su li / -t"

# snapper aliases
alias snapcroot "sudo snapper -c root create-config /"
alias snapchome "sudo snapper -c home create-config /home"
alias snapli "sudo snapper list"
alias snapcr "sudo snapper -c root create"
alias snapch "sudo snapper -c home create"

# Merge Xresources
alias merge 'xrdb -merge ~/.Xresources'

# git
alias lg lazygit

# youtube-dl
alias yt "yt-dlp --embed-metadata -i"
alias yta "yt -x -f bestaudio/best"
alias ytm "yt --audio-format mp3 --audio-quality 0"
alias ffmpeg "ffmpeg -hide_banner"

# ostree
alias srs "sudo rpm-ostree status"
alias ssr "systemctl reboot"

# Chezmoi
alias ca "chezmoi add"
alias ccd "chezmoi cd"
