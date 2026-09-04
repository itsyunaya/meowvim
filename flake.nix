{
	description = "mraow mrrp";

	inputs = {
		mnw.url = "github:Gerg-L/mnw";
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs, mnw }: let
		systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
		forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
	in {
		packages = forAllSystems (pkgs: let
			nvim = import ./wrapper.nix { inherit pkgs mnw; };
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
