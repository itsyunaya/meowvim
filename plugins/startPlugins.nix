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
		markdown
	]);
in {
	cmdline = callPackage ./startPlugins/cmdline.nix {};
	hydra = callPackage ./startPlugins/hydra.nix {};

	inherit treesitter;

	inherit
    	(pkgs.vimPlugins)
			blink-cmp
			catppuccin-nvim
			colorful-menu-nvim
			conform-nvim
			vim-fugitive
			hop-nvim
			mini-notify
			multicursor-nvim
			nvim-autopairs
			nvim-highlight-colors
			nvim-lspconfig
			nvim-navic
			nvim-spider
			nvim-tree-lua
			nvim-web-devicons
			lualine-nvim
			plenary-nvim
		    render-markdown-nvim	 	
			telescope-nvim
			gitsigns-nvim
			toggleterm-nvim	
		; 
}
