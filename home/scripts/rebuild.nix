{
  config,
  options,
  pkgs,
  lib,
  ...
}: {

  	home.file.".local/bin/rebuild" = {
		executable = true;
		text = ''
#!/bin/sh
sudo nixos-rebuild switch
	'';
	};
}
