
{
  config,
  options,
  pkgs,
  lib,
  ...
}: {
  	home.file.".config/wofi/power-menu.sh" = {
		executable = true;
		text = ''
#!/usr/bin/env bash

op=$( echo -e " Poweroff\n Reboot\n Suspend\n Lock\n Logout" | wofi -i --dmenu -c $HOME/.config/wofi/power-menu-config -s $HOME/.config/wofi/power-menu.css | awk '{print tolower($2)}' )

case $op in 
        poweroff)
                ;&
        reboot)
                ;&
        suspend)
                systemctl $op
                ;;
        lock)
                systemctl --user start lock
                ;;
        logout)
                pkill Hyprland
                ;;
esac
	'';

	};


  	xdg.configFile."wofi/power-menu-config".text = ''
location=center
height=27%
width=25%
allow_images=true
term=foot
	'';

	xdg.configFile."wofi/power-menu.css".text = ''
window {
  background-color: #2d2329;
  color: white;
  border: 2px solid #bd93f9;
}

#input {
  margin: 20px;
  border: 2px solid #bd93f9;
  background-color: #222222; 
  color: white;
}

#inner-box {
  margin: 20px;
  background-color: #2d2329;
  color: white;
}

#entry {
  font-size: 15px;
  margin-top: 5px;
  margin-bottom: 5px;
}

#entry:selected{
  border: 2px solid #bd93f9;
  background-color: transparent;
  border-radius: 4px;
}

#img {
  margin-right: 5px;
}
	'';

}
