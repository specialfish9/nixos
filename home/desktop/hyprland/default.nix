{
  config,
  options,
  pkgs,
  lib,
  ...
}: {

  xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;

}
