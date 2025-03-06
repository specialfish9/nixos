{
  ...
}: {
  programs.bash = {
    	enable = true;
	bashrcExtra = ''
	EDITOR="nvim"
	PS1='\[\e[38;5;177m\]\u\[\e[92;1m\] at \[\e[0;38;5;123m\]\h\[\e[92;1m\] in \[\e[0;38;5;214m\]\w \[\e[0;3m\]$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2) \[\e[0;38;5;202;1m\]\\$\[\e[0m\] '
	'';
  };
}
