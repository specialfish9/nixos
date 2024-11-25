{
  config,
  options,
  pkgs,
  lib,
  ...
}: {

  	home.file.".local/bin/scr".text = ''
	#!/bin/sh

	dir="$(xdg-user-dir PICTURES)/screens/$(date +%m-%d-%y)"

	if [ ! -d "$dir" ]; then
	  mkdir -p $dir
	fi

	date=$(date +%m-%d-%y--%H-%M-%S.png)
	grim -g "$(slurp -d -w 0)" "$dir/$date"

	size=$(du -sh "$dir/$date" | awk '{print $1}')
	notify-send -t 5000 "screenshot taken - $size" "$date"
	'';

}
