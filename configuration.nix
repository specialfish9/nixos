{ config, pkgs, inputs, ... }:
{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./home/home-manager.nix
    ];

  # Bootloader.
  boot.loader = {
       systemd-boot.enable = true;
	# grub = {
	#     device = "nodev";
	#     enable = true;
	#     useOSProber = true;
	#     efiSupport = true;
	#   };
  	efi.canTouchEfiVariables = true;
  };

  # Network
  networking.hostName = "edgar"; 
  networking.networkmanager.enable = true;
  hardware.bluetooth = {
  	enable = true;
	disabledPlugins = ["input" "hog"];
  };

  # Time & lang
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # GNOME

 services.xserver = {
 	enable = true;
 	desktopManager.gnome.enable = true;
 	displayManager.gdm.enable = true;
 };

  services.displayManager = {
  		sessionPackages = [pkgs.sway];
  };

  xdg.portal.enable = true;
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


  programs.hyprland = {
  	enable = true;
	xwayland.enable = true;
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "it";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "it2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mattia = {
    isNormalUser = true;
    description = "mattia";
    extraGroups = [ "mattia" "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.sessionVariables= {
  	WLR_NO_HARDWARE_CURSORS = "1";
	NIXOS_OZONE_WL = "1";
  };

  environment.localBinInPath = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  	alacritty
	brightnessctl
	git
	htop
	killall
	neovim
	nerdfonts
	python3
	pulseaudio
	wireguard-tools
	wl-clipboard
	unzip

	xournalpp
  ];

  fonts.packages = with pkgs; [
     fira-code
     fira-code-symbols
  ];

  security.polkit.enable = true;

  programs.steam = {
	enable = true;
  };

  virtualisation.docker.enable = true;

  networking.firewall = {
  	allowedUDPPorts = [ 51820 ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
