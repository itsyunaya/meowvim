{ pkgs, mnw }: mnw.lib.wrap pkgs {
	appName = "meowvim";
	aliases = [ "vi" "nvm" ];

	initLua = ''require("init")'';

	plugins = {
		startAttrs = import ./plugins/startPlugins.nix { inherit pkgs; };

		dev.conf = {
			pure = ./meowvim;
			# todo: unhardcode
			impure = "/home/ashley/Documents/Development/IdeaProjects/meowvim/meowvim";
		};
	};

	extraBinPath = [
		# add lightweight lang servers here so they can be bundled into the package.
		# do *not* add something like rust-analyzer, since it relies on too
		# many different things and could cause rust version mismatches
		pkgs.lua-language-server
		pkgs.nil
	];
}
