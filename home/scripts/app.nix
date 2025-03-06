{
  config,
  options,
  pkgs,
  lib,
  ...
}: {

  	home.file.".local/bin/app" = {
		executable = true;
		text = ''
#!/bin/sh

nb e $1:$1.typ
	'';
	};

  	home.file.".local/bin/apphome" = {
		executable = true;
		text = ''
#!/bin/sh

cd $HOME/.nb
	'';
	};

  	home.file.".local/bin/apppdf" = {
		executable = true;
		text = ''
#!/bin/sh

evince $HOME/.nb/$1/$1.pdf &
	'';
	};

  	home.file.".local/bin/appsync" = {
		executable = true;
		text = ''
#!/bin/sh

nb sync -a
	'';
	};
}
