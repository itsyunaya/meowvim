# adding a plugin here means that it'll be run at startup of every nvim invocation, no lazy loading
# useful for things that should always be present, like parens/quote matching
{ pkgs }: let
	inherit (pkgs) callPackage;
in {
	cmdline = callPackage ./startPlugins/cmdline.nix {};
	hydra = callPackage ./startPlugins/hydra.nix {};
	project = callPackage ./startPlugins/project.nix {};
	session-manager = callPackage ./startPlugins/session-manager.nix {};

	inherit
		(pkgs.vimPlugins)
		blink-cmp
		catppuccin-nvim
		colorful-menu-nvim
		conform-nvim
		gitsigns-nvim
		hop-nvim
		lualine-nvim
		lz-n
		mini-notify
		multicursor-nvim
		nvim-autopairs
		nvim-highlight-colors
		nvim-lspconfig
		nvim-navic
		nvim-spider
		nvim-tree-lua
		nvim-web-devicons
		plenary-nvim
		telescope-nvim
		toggleterm-nvim
		vim-fugitive
		todo-comments-nvim
		;
}
