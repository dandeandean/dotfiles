{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ################### User ###################
    fastfetch
    htop
    curl
    nettools
    powershell
    nvimpager
    cowsay
    opentofu
    k3d
    k9s
    jq
    tree
    fzf

    ###################### DEV ######################
    uv
    sqlite
    lazygit
    gnumake

    ################### NVIM DEPS ###################
    ripgrep
    zk
    luarocks
    lua
    rustc
    cargo
    go
    nodejs_22
    unzip
    # Breaking in the Darwin build
    # gcc_multi

    nnn
    bat
    auth0-cli
  ];
}
