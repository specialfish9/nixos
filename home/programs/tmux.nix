{
  config,
  options,
  pkgs,
  lib,
  ...
}: 
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in 
{

  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = ''

# remap prefix from 'C-b' to 'M-a'
unbind C-b
set-option -g prefix M-a
bind-key M-a send-prefix

# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Enable mouse control (clickable windows, panes, resizable panes)
set -g mouse on

# panes
set -g pane-border-style 'fg=red'
set -g pane-active-border-style 'fg=yellow'

# statusbar
set -g status-position bottom
set -g status-justify left
set -g status-style 'fg=red'

set -g status-left \'\'
set -g status-left-length 10

set -g status-right-style 'fg=black bg=yellow'
set -g status-right '%Y-%m-%d %H:%M '
set -g status-right-length 50

setw -g window-status-current-style 'fg=black bg=red'
setw -g window-status-current-format ' #I #W #F '

setw -g window-status-style 'fg=red bg=black'
setw -g window-status-format ' #I #[fg=white]#W #[fg=yellow]#F '

setw -g window-status-bell-style 'fg=yellow bg=red bold'

set -g default-terminal "screen-256color"
    '';
  };
}
