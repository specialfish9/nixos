{
  config,
  options,
  pkgs,
  libs,
  ...
}:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{
  imports = [ (import "${home-manager}/nixos") ];

  home-manager.users.mattia = {
    home.stateVersion = "24.05";

    home.sessionVariables.EDITOR = "nvim";

    home.sessionPath = [ "$HOME/.local/bin" ];

    home.packages = with pkgs; [
      swaybg
      eww
      dunst
      xdg-user-dirs
      grim
      slurp
      libnotify
      jq
      unstable.zellij

      gcc

      spotify
      tmate
      obs-studio

      calcure
      inkscape
      libreoffice-qt
      steghide

      xournalpp
      nb
      (aspellWithDicts (
        dicts: with dicts; [
          en
          en-computers
          en-science
        ]
      ))
      unstable.typst
      jetbrains.idea-community

      jdk
      (import ./programs/python.nix pkgs)
    ];

    imports = [
      ./desktop/hyprland.nix
      ./desktop/waybar.nix
      ./desktop/wofi.nix
      ./desktop/power-menu.nix
      ./desktop/alacritty.nix
      ./desktop/bash.nix

      ./programs/git.nix
      ./programs/nvim.nix
      ./programs/tmux.nix
      ./programs/zellij.nix

      ./scripts/scr.nix
      ./scripts/impostazioni.nix
      ./scripts/rebuild.nix
      ./scripts/app.nix
    ];
  };

}
