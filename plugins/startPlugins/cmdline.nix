{ fetchFromGitHub }: {
	name = "cmdline-nvim";
	version = "0-unstable-2025-4-3";
	src = fetchFromGitHub {
		owner = "vzze";
		repo = "cmdline.nvim";
		rev = "6ef6b895900a1fd78b8217db4165cc79e3b9a78d";
		hash = "sha256-fXK59eb/9iEvNnIudpm0dm68Dv6RWHsNcmW78cKhMy8=";
	};
}