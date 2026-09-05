{ pkgs }: {
	inherit
		(pkgs.vimPlugins)
		lazydev-nvim
		typst-preview-nvim
		;
}
