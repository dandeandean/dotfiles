{pkgs, ...}:{

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "25.05"; # Static here too
  home.username = "ddd";
  home.homeDirectory = "/home/ddd";
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
    opentofu
    k3d
    k9s
    jq
    tree
    fzf

    ###################### DEV ######################
    uv
    sqlite

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

    #################### DEKSTOP ####################
    nerd-fonts.fira-code
    wofi
    waybar
    hyprpaper
    ghostty
    firefox
  ];
  fonts.fontconfig.enable = true;

  ###################### GIT ######################
  programs = {
    git = {
      enable = true;
      userName  = "dandeandean";
      userEmail = "dandean44523@gmail.com";
    };
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };


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
}
