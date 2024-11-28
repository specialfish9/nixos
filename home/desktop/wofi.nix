{
  config,
  options,
  pkgs,
  lib,
  ...
}: {

	programs.wofi = {
		enable = true;
		settings = {
			location = "center";
			height = "35%";
			width = "30%";
			term = "foot";
			stylesheet = "style.css";
			show = "drun";
			matching = "fuzzy";
			no_actions = true;
			always_parse_args = true;
			show_all = true;
			print_command = true;
			layer = "overlay";
			insensitive = true;
			prompt = "Search...";
			allow_markup = true;
			allow_images = true;
		};
	};
	


  	xdg.configFile."wofi/style.css".text = ''
		window {
		  background-color: #222;
		  color: white;
		  border: 2px solid #f8bd96;
		  padding: 10px;
		}

		#input {
		  margin: 20px;
		  border: 2px solid #f8bd96;
		  background-color: #222222; 
		  color: white;
		}

		#inner-box {
		  margin: 20px;
		  background-color: #222;
		  color: white;
		}

		#entry {
		  margin-bottom: 5px;
		  margin-top: 5px;
		  font-size: 15px;
		}

		#entry:selected{
		  border: 2px solid #f8bd96;
		  background-color: transparent;
		  border-radius: 4px;
		  margin-bottom: 5px;
		  margin-top: 5px;
		}

		#img {
		  margin-right: 5px;
		}
	'';


}
