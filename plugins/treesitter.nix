{ pkgs }: let
	treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (p:
		with p; [
			# main langs
			rust
			nix
			lua
			typst

			# things i'm currently messing around with
			cpp
			cmake
			haskell

			# jvm
			java
			kotlin

			# miscellaneous
			comment
			gitcommit
			luadoc
		]);
in [ treesitter ]
