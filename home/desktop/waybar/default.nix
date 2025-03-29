{
  config,
  options,
  pkgs,
  lib,
  ...
}: {

  programs.waybar = {
    enable = true;

    settings = [{
	  layer = "top";
  	position = "top";
	  modules-left = ["sway/workspaces" "hyprland/workspaces"];
	  modules-right = ["tray"];
	  modules-center = [ "clock" "battery""network" "cpu" "temperature" "memory" "backlight" "pulseaudio"];

	
	pulseaudio = {
		tooltip = false;
		scroll-step = 5;
		format = "{icon} {volume}%";
		format-muted = "{icon} {volume}%";
		on-click ="pactl set-sink-mute @DEFAULT_SINK@ toggle";
		format-icons = {
			default = ["" "" ""];
		};
	};

	"hyprland/workspaces" = {
		justify = "center";
	    	format = "{name} {icon}";
	    	on-click = "activate";
	    	all-outputs = false;
	    	format-icons = {
	      		urgent = "";
	      		focused = "";
	      		active = "";
	      		default = "";
	    	};
	};

	"sway/workspaces" = {
		justify = "center";
	    	format = "{name} {icon}";
	    	on-click = "activate";
	    	all-outputs = false;
	    	format-icons = {
	      		urgent = "";
	      		focused = "";
	      		active = "";
	      		default = "";
	    	};
	};

 	network = {
		tooltip = true;
    		justify = "center";
		format-wifi = "{icon} {essid}";
    		tooltip-format-wifi = "{essid}";
		format-ethernet = "ETH";
    		format-icons = [""];
	};

	backlight = {
    		justify = "center";
		tooltip = true;
		format = " {}%";
		interval =1;
	};

    	battery = {
		states = {
		    warning = 30;
		    critical = 15;
		};
		justify = "center";
		format = "{icon} {capacity}%";
		format-charging = " {capacity}%";
		format-plugged = " {capacity}%";
		format-alt = "{icon} {time}";
		format-icons = ["" ""  "" "" "" "" "" "" "" "" "" ""];
    };

	tray ={
		icon-size =18;
		spacing = 10;
	};

    	clock = {
	      	justify = "center";
		format-alt = "{:%H:%M}";
		format = "{:%H:%M %d %b}";
		tooltip = true;
		tooltip-format = "<tt><small>{calendar}</small></tt>";
		calendar = {
			mode = "year";
			mode-mon-col = 3;
			weeks-pos = "right";
			on-scroll = 1;
			on-click-right = "mode";
			format = {
				months = "<span color='#ffead3'><b>{}</b></span>";
				days = "<span color='#ecc6d9'><b>{}</b></span>";
				weeks = "<span color='#99ffdd'><b>W{}</b></span>";
				weekdays = "<span color='#ffcc66'><b>{}</b></span>";
				today = "<span color='#ff6699'><b><u>{}</u></b></span>";
			};
		};
	};

	cpu = {
		interval = 15;
		format = "{icon} {0}%";
		justify = "center";
		format-icons = [""];
	};

    	memory = {
		justify = "center";
		interval = 30;
		format = " {}%";
    	};
	
	temperature = {    
		justify = "center";
		thermal-zone = 0;
		critical-threshold = 80;
		format = " {temperatureC}°C";
	  };
	}

    ];

  };

  xdg.configFile."waybar/style.css".source = ./waybar.css;
}
