{ config, pkgs, ... }:
{
  home.username = "ddd";
  home.homeDirectory = "/home/ddd";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
    ################### User ###################
    fastfetch
    htop
    zsh
    tmux
    curl
    nettools
    powershell
    nvimpager
    nmap
    cowsay
    gh
    opentofu
    k3d
    k9s

    ################### NVIM DEPS ###################
    ripgrep
    zk
    luarocks
    lua
    rustc
    cargo
    go
    nodejs_22
    gcc_multi
    unzip

    ################### FONTS ###################
    nerd-fonts.fira-code
  ];

  programs.git = {
    enable = true;
    userName  = "dandeandean";
    userEmail = "dandean44523@gmail.com";
  };
  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
