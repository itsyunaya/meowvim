{ pkgs, mnw }: mnw.lib.wrap pkgs {
	appName = "meowvim";
	aliases = [ "vi" "nvm" ];

	initLua = ''require("init")'';

	plugins = {
		# adding a plugin here means that it'll be run at startup of every nvim invocation, no lazy loading
		# useful for things that should always be present, like parens/quote matching
		start = let
			treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [
				comment
				gitcommit
				lua
				luadoc
				nix
			]);
		in builtins.attrValues {
			inherit
				treesitter
				;

			inherit
				(pkgs.vimPlugins)
				blink-cmp
				colorful-menu-nvim
				nvim-autopairs
				nvim-lspconfig
				transparent-nvim
				;
		};

		dev.conf = {
			pure = ./meowvim;
			# todo: unhardcode
			impure = "/home/ashley/Documents/Development/IdeaProjects/meowvim/meowvim";
		};
	};

	extraBinPath = [
		pkgs.lua-language-server
	];
}
