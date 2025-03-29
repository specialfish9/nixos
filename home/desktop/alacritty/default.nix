{
  config,
  options,
  pkgs,
  lib,
  ...
}: {
	programs.alacritty = {
		enable = true;
	};
	
  	xdg.configFile."alacritty/alacritty.toml".source = ./alacritty.toml;
}
