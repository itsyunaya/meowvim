# adding a plugin here means that it'll be run at startup of every nvim invocation, no lazy loading
# useful for things that should always be present, like parens/quote matching
{ pkgs }: let
	inherit (pkgs) callPackage;

	treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [
		comment
		gitcommit
		lua
		luadoc
		nix
		rust
	]);
in {
	cmdline = callPackage ./startPlugins/cmdline.nix {};

	inherit treesitter;

	inherit
    	(pkgs.vimPlugins)
			blink-cmp
			catppuccin-nvim
			colorful-menu-nvim
			mini-notify
			nvim-autopairs
			nvim-highlight-colors
			nvim-lspconfig
			nvim-tree-lua
			nvim-web-devicons
			nvim-navic
			lualine-nvim
			hop-nvim
		;
}
