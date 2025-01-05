set fish_greeting
set TERM xterm-256color
set EDITOR nvim
set LANGUAGE "en_US.UTF-8"
set LC_ALL "c.en_US.UTF-8"
set -x GPG_TTY (tty)

set QT_QPA_PLATFORM wayland
set QT_STYLE_OVERRIDE adwaita
set QT_WAYLAND_DECORATION adwaita

fish_vi_key_bindings
eval (ssh-agent -c)

# Use terminal colors for most things
set -g fish_color_normal normal
set -g fish_color_command cyan
set -g fish_color_keyword magenta
set -g fish_color_quote yellow
set -g fish_color_redirection normal
set -g fish_color_end green
set -g fish_color_error red
set -g fish_color_param blue
set -g fish_color_comment brblack
set -g fish_color_selection --background=brblue
set -g fish_color_search_match --background=brblue
set -g fish_color_operator green
set -g fish_color_escape magenta
set -g fish_color_autosuggestion brblack

## TokyoNight Color Palette
#set -l foreground c8d3f5
#set -l selection 3654a7
#set -l comment 7a88cf
#set -l red ff757f
#set -l orange ff966c
#set -l yellow ffc777
#set -l green c3e88d
#set -l purple fca7ea
#set -l cyan 86e1fc
#set -l pink c099ff
#
## Syntax Highlighting Colors
#set -g fish_color_normal $foreground
#set -g fish_color_command $cyan
#set -g fish_color_keyword $pink
#set -g fish_color_quote $yellow
#set -g fish_color_redirection $foreground
#set -g fish_color_end $orange
#set -g fish_color_error $red
#set -g fish_color_param $purple
#set -g fish_color_comment $comment
#set -g fish_color_selection --background=$selection
#set -g fish_color_search_match --background=$selection
#set -g fish_color_operator $green
#set -g fish_color_escape $pink
#set -g fish_color_autosuggestion $comment
#
## Completion Pager Colors
#set -g fish_pager_color_progress $comment
#set -g fish_pager_color_prefix $cyan
#set -g fish_pager_color_completion $foreground
#set -g fish_pager_color_description $comment
#set -g fish_pager_color_selected_background --background=$selection

if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -f $HOME/.config/fish/aliases.fish
        source $HOME/.config/fish/aliases.fish
    end

    zoxide init fish | source
    atuin init fish | source
end
# set -Ux PATH $HOME/.lando/bin $PATH

# Use Cargo
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end

source (/home/linuxbrew/.linuxbrew/bin/starship init fish --print-full-init | psub)

# Add to PATH if needed
set -U fish_user_paths /usr/local/bin $fish_user_paths
