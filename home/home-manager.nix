{ 
	config,
	options,
	pkgs, 
	libs,
	... 
}:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.mattia = {
    home.stateVersion = "24.05";

    home.packages = [
	pkgs.swaybg
	pkgs.dunst
    	pkgs.xdg-user-dirs
    	pkgs.grim
    	pkgs.slurp
    	pkgs.libnotify
    ];

    programs.git = {
    	enable = true;
	userName = "Mattia";
	userEmail = "mgiro2001@gmail.com";
    };

    imports = [
    	./desktop/hyprland.nix
    	./desktop/waybar.nix
    	./desktop/wofi.nix

    	./programs/nvim.nix
    	./scripts/scr.nix
    ];
  };
}
