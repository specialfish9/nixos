{pkgs, ...}:{
  xdg.configFile."sway/config".source = pkgs.lib.mkOverride 0 ./sway;

  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;
    systemd.enable = true;
  };

}

