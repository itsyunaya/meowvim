{ fetchFromGitHub }: {
	name = "session-manager";
	version = "red";
	src = fetchFromGitHub {
		owner = "Shatur";
		repo = "neovim-session-manager";
		rev = "89d253a6c68af60b49570044591d5b8701866601";
		hash = "sha256-d7lXPIy6qJDPvFk8twwkqKUWI205HfTqXMspnVRkng0=";
	};
}
