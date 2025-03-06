{
  config,
  options,
  pkgs,
  lib,
  ...
}: {

  	home.file.".local/bin/impostazioni" = {
		executable = true;
		text = ''
#!/bin/sh

XDG_CURRENT_DESKTOP=GNOME gnome-control-center
	'';
	};
}
