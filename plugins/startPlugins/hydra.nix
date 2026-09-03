{ fetchFromGitHub }: {
	name = "hydra-nvim";
	version = "1.0.3";
	src = fetchFromGitHub {
		owner = "nvimtools";
		repo = "hydra.nvim";
		rev = "8c4a9f621ec7cdc30411a1f3b6d5eebb12b469dc";
		hash = "sha256-lYwl4wrVsCq1JVbkDyq1lB1hBGrz+XtQ9DQWIQ6lkyg=";
	};
}
