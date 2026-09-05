{ pkgs }: let
	treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (p:
		with p; [
			comment
			gitcommit
			lua
			luadoc
			nix
			rust
			typst
		]);
in [ treesitter ]
