{
  config,
  options,
  pkgs,
  lib,
  ...
}: 
{
    xdg.configFile."zellij/config.kdl".source = ./zellij.kdl;

}
