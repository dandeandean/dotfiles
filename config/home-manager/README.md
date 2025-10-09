# Darwin

The install was a bit janky, but this command seemed to work.
I needed to change the version in the default config from 25.05 to 24.05.
```bash
nix run home-manager/release-24.05 -- init --switch --home-manager-url github:nix-community/home-manager/release-24.05 --nixpkgs-url github:nixos/nixpkgs/nixos-24.05
```
