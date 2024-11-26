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

    programs.bash = {
    	enable = true;
	bashrcExtra = ''
	PS1='\[\e[38;5;177m\]\u\[\e[92;1m\] at \[\e[0;38;5;123m\]\h\[\e[92;1m\] in \[\e[0;38;5;214m\]\w \[\e[0;3m\]$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2) \[\e[0;38;5;202;1m\]\\$\[\e[0m\] '
	'';
    };

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
