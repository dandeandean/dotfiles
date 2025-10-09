{ config, pkgs, ... }:
let
  username = "dandean";
  homeDir = "/Users/${username}";
in
{
  imports = [
    ./home.packages.nix
    ./home.shell.nix
  ];
  home.username = username;
  home.homeDirectory = homeDir;
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
