{
  config,
  options,
  pkgs,
  lib,
  ...
}: {

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [{
	layer = "top";
  	position = "right";
	modules-left = ["hyprland/workspaces"];
	modules-right = ["tray"];
	modules-center = [ "clock" "battery""network" "cpu" "temperature" "memory" "backlight" "pulseaudio"];
	
	pulseaudio = {
		tooltip = false;
		scroll-step = 5;
		format = "{icon}\n{volume}%";
		format-muted = "{icon} {volume}%";
		on-click ="pactl set-sink-mute @DEFAULT_SINK@ toggle";
		format-icons = {
			default = ["" "" ""];
		};
	};

	"hyprland/workspaces" = {
		justify = "center";
	    	format = "{name}\n{icon}";
	    	on-click = "activate";
	    	all-outputs = false;
	    	format-icons = {
	      		urgent = "";
	      		active = "";
	      		default = "";
	    	};
	};

 	network = {
		tooltip = true;
    		justify = "center";
		format-wifi = "{icon}";
    		tooltip-format-wifi = "{essid}";
		format-ethernet = "ETH";
    		format-icons = [""];
	};

	backlight = {
    		justify = "center";
		tooltip = true;
		format = "\n{}%";
		interval =1;
	};

    	battery = {
		states = {
		    warning = 30;
		    critical = 15;
		};
		justify = "center";
		format = "{icon}\n{capacity}%";
		format-charging = "\n{capacity}%";
		format-plugged = "\n{capacity}%";
		format-alt = "{icon}\n{time}";
		format-icons = ["" ""  "" "" "" "" "" "" "" "" "" ""];
    };

	tray ={
		icon-size =18;
		spacing = 10;
	};

    	clock = {
	      	justify = "center";
		format-alt = "{:%H:%M}";
		format = "{:%H:%M\n%d\n%b}";
	};

	cpu = {
		interval = 15;
		format = "{icon}\n{0}%";
		justify = "center";
		format-icons = [""];
	};

    	memory = {
		justify = "center";
		interval = 30;
		format = "\n{}%";
    	};
	
	temperature = {    
		justify = "center";
		thermal-zone = 0;
		critical-threshold = 80;
		format = "\n{temperatureC}°C";
	  };
	}

    ];

  };

  xdg.configFile."waybar/style.css".source = ./waybar.css;
}
