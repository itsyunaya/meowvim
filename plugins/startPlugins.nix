# adding a plugin here means that it'll be run at startup of every nvim invocation, no lazy loading
# useful for things that should always be present, like parens/quote matching
{ pkgs }: let
	inherit (pkgs) callPackage;
in {
	cmdline = callPackage ./startPlugins/cmdline.nix {};
	hydra = callPackage ./startPlugins/hydra.nix {};

	# lei specific custom
	project = callPackage ./startPlugins/project.nix {};
	session-manager = callPackage ./startPlugins/session-manager.nix {};

	inherit
		(pkgs.vimPlugins)
		blink-cmp
		catppuccin-nvim
		colorful-menu-nvim
		conform-nvim
		gitsigns-nvim
		hardtime-nvim
		hop-nvim
		lualine-nvim
		lz-n
		mini-notify
		nvim-autopairs
		nvim-highlight-colors
		nvim-lspconfig
		nvim-navic
		nvim-surround
		nvim-tree-lua
		nvim-web-devicons
		plenary-nvim
		telescope-nvim
		tiny-inline-diagnostic-nvim
		vim-fugitive
		todo-comments-nvim

		# lei specific
		multicursor-nvim
		nvim-spider
		toggleterm-nvim
		;
}
