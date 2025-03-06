{
  pkgs,
  ...
}: (
	pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
		pwntools
		pycryptodome
		caldav
		bluepy
		pyyaml
		requests
		dnspython
		sympy
    	])

)
