{
	description = "mraow mrrp";

	inputs = {
		mnw.url = "github:Gerg-L/mnw";
		nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
		
		nvim-source = {
			url = "github:neovim/neovim";
			flake = false;
		};
	};

	outputs = { self, nixpkgs, mnw, nvim-source }: let
		systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
		forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
	in {
		packages = forAllSystems (pkgs: let
			nvim = import ./wrapper.nix { inherit pkgs mnw nvim-source; };
		in {
			default = nvim;
			inherit nvim;
		});

		devShells = forAllSystems (pkgs: {
			default = pkgs.mkShellNoCC {
				packages = nixpkgs.lib.singleton self.packages.${pkgs.stdenv.hostPlatform.system}.default.devMode;
			};
		});
	};
}
