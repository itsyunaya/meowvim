{ fetchFromGitHub }: {
	name = "neovim-project";
	version = "green";
	src = fetchFromGitHub {
		owner = "coffebar";
		repo = "neovim-project";
		rev = "f4e9b3392dc46b6e615b629a40ea4fa47cc2a203";
		hash = "sha256-BUco01ZPzDNrbjsUCYY6+Furir3mKxaqCNNDQLhPRn0=";
	};
}
