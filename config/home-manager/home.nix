{ pkgs, ... }:
{
  home.username = "ddd";
  home.homeDirectory = "/home/ddd";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
    home-manager
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
    jq
    tree
    fzf

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

  # nix = {
  #   package = pkgs.nix;
  #   settings.experimental-features = [ "nix-command" "flakes" ];
  # };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      v = "nvim";
      reload = "source $HOME/.zshrc";
      config = "nvim $HOME/.config/";
      manage = "nvim $HOME/.config/home-manager/";
      nixedit = "sudoedit /etc/nixos/configuration.nix";
      nixupdate = "sudo nixos-rebuild switch";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
    initExtra = ''
      if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	exec tmux
      fi
      export ZK_NOTEBOOK_DIR="$HOME/notes"
      export EDITOR="nvim"
      source $HOME/git/dotfiles/config/zsh/main.zsh
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
