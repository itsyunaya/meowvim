# meowvim
(name not final)

## Getting started

### Nix run
```bash
nix run github:itsyunaya/meowvim
```

### Package
1. Add via your pinning tool of choice

Tack:
```toml
[inputs]
meowvim.url = "github:itsyunaya/meowvim"
```

Flakes:
```nix
inputs = {
    meowvim = {
        url = "github:itsyunaya/meowvim";
        inputs.nixpkgs.follows = "nixpkgs";
    };
};
```

2. Add to packages
```nix
environment.systemPackages = with pkgs; [
    inputs.meowvim.packages.${pkgs.stdenv.hostPlatform.system}.default;
]
```

3. Rebuild

## Credits

This repository is largely inspired by [llakala's neovim config](https://github.com/llakala/meovim), please check out her stuff, she's awesome
