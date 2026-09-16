{ pkgs }: {
	inherit
		(pkgs.vimPlugins)
		lazydev-nvim
		markdown-preview-nvim
		typst-preview-nvim
		;
}
