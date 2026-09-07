{ pkgs, mnw, nvim-source }:
mnw.lib.wrap pkgs {
	appName = "meowvim";
	aliases = [ "vi" "nvm" ];

	neovim = pkgs.neovim-unwrapped.overrideAttrs {
		doCheck = false;
		doInstallCheck = false;

		src = nvim-source;
	};

	initLua = ''require("init")'';

	plugins = {
		startAttrs = import ./plugins/startPlugins.nix { inherit pkgs; };
		start = import ./plugins/treesitter.nix { inherit pkgs; };
		optAttrs = import ./plugins/optPlugins.nix { inherit pkgs; };

		dev.conf = {
			pure = ./meowvim;
			# todo: unhardcode
			impure = "/home/ashley/Documents/projects/meowvim/meowvim";
		};
	};

	extraBinPath = [
		# add lightweight lang servers here so they can be bundled into the package.
		# do *not* add something like rust-analyzer, since it relies on too
		# many different things and could cause rust version mismatches
		pkgs.lua-language-server
		pkgs.nil
		pkgs.tinymist

		pkgs.stylua

		pkgs.ripgrep
		pkgs.fd

		pkgs.nodejs-slim # needed by the md previewer, remove if we ever stop using it
	];
}
