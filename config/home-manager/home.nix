{ pkgs, lib, ... }:
let bloat = true;
in {
  # Let Home Manager install and manage itself.
  config = {
    programs.home-manager.enable = true;
    home = {
      stateVersion = "25.05"; # Static here too
      username = "ddd";
      homeDirectory = "/home/ddd";
      # Disable warning about pkgs mismatch
      enableNixpkgsReleaseCheck = false;
      packages = with pkgs;
        [
          ################### User ###################
          fastfetch
          htop
          curl
          nettools
          powershell
          nvimpager
          nmap
          cowsay
          opentofu
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

          ## LSPs ### (that Mason can't sort out)
          rust-analyzer
          lua-language-server
        ]
        #################### DEKSTOP ####################
        ++ lib.optionals bloat [
          nerd-fonts.agave
          wofi
          waybar
          ghostty
          firefox
          sway
          autotiling-rs
        ];
    };
    fonts.fontconfig.enable = true;

    ###################### GIT ######################
    programs = {
      git = {
        enable = true;
        userName = "dandeandean";
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
        config = "$EDITOR $HOME/.config/";
        manage = "$EDITOR $HOME/.config/home-manager/";
        nixedit = "$EDITOR $HOME/git/nixos-config";
        nixupdate = "sudo nixos-rebuild switch";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
      };
      initContent = ''
        source $HOME/git/dotfiles/config/zsh/main.zsh
      '';
    };

    programs.tmux = {
      enable = true;
      clock24 = true;
      plugins = with pkgs.tmuxPlugins; [ yank ];
      extraConfig = builtins.readFile ./extra/tmux.conf;
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
