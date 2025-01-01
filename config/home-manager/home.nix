{ inputs, config, pkgs, ... }:
{
  # Refs:
  # https://gitlab.com/hmajid2301/nixicle/-/tree/ccb08009df7e0d884db790bca57317748661e35b/home-manager
  # 
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
  home.username = "ddd";
  home.homeDirectory = "/home/ddd";
  # TODO: undo this & figure out what's going on
  home.enableNixpkgsReleaseCheck = false;
  home.packages = with pkgs; [
    htop
    # nvim deps########
    ripgrep
    zk
    rocmPackages_5.llvm.clang-unwrapped
    luarocks
    lua
    rustc
    cargo
    go
    python39
    nodejs_22
    gcc_multi #nvim treesitter need this
    unzip
    ###################
    # Nerd Fonts
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  fonts.fontconfig.enable = true;

  programs.neovim = {
    #TODO: override nvim with nvim nightly ... see: inputs.neovim-nightly-overlay
    # https://gitlab.com/hmajid2301/nixicle/-/blob/ed8f60b6f27980508161d337e0a75ebb655cb19b/home-manager/default.nix#L52
    enable = true;
    #package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      v = "nvim";
      reload = "source $HOME/.zshrc";
      config = "nvim $HOME/.config/";
      manage = "nvim $HOME/.config/home-manager/";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
    initExtra = ''
      if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	exec tmux
      fi
    '';
    sessionVariables = {
      ZK_NOTEBOOK_DIR = "$HOME/notes";
    };
  };

  programs.git = {
    enable = true;
    userName  = "dandeandean";
    userEmail = "dandean44523@gmail.com";
  };
  programs.tmux = {
    enable = true;
    clock24 = true;
    plugins = with pkgs.tmuxPlugins; [
	yank
	{
	  plugin = dracula;
	  extraConfig = ''
	    set -g @dracula-plugins "battery time git"
	    set -g @dracula-time-format "%A %R"
	    set -g @dracula-show-left-icon '🧛'
	    set -g @dracula-battery-label '🩸'
	    '';
	}
    ];
    extraConfig = ''
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      set -s escape-time 0
      unbind C-b
      set-option -g prefix C-l
      bind-key C-l send-prefix
      bind \\ split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %
      set -g mouse on
      set-window-option -g mode-keys vi
      '';
  };	
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
