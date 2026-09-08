{ pkgs }: {
	inherit
		(pkgs.vimPlugins)
		lazydev-nvim
		markdown-preview-nvim
		nvim-jdtls
		typst-preview-nvim
		;
}
