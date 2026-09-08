{ pkgs }: let
	treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (p:
		with p; [
			# main langs
			rust
			nix
			lua
			typst

			# jvm
			java
			kotlin

			# miscellaneous
			comment
			gitcommit
			luadoc
		]);
in [ treesitter ]
