{pkgs, ...}:{

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home = {
    stateVersion = "25.05"; # Static here too
    username = "ddd";
    homeDirectory = "/home/ddd";
    # Disable warning about pkgs mismatch
    enableNixpkgsReleaseCheck = false;
    packages = with pkgs; [
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
  };
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
    initContent = ''
      if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	exec tmux
      fi
      export ZK_NOTEBOOK_DIR="$HOME/notes"
      export EDITOR="nvim"
      source $HOME/git/dotfiles/config/zsh/main.zsh
    '';
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    plugins = with pkgs.tmuxPlugins; [
      yank
    ];
    extraConfig = ''
      # add: source-file & path to this file in ~/.tmux.conf
      bind r source-file ~/.tmux.conf

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      set -s escape-time 0
      set -g mouse on

      # split panes using | and -
      bind \\ split-window -h  -c "#{pane_current_path}"
      bind - split-window -v  -c "#{pane_current_path}"
      unbind '"'
      unbind %

      ## Start panes at 1, not 0
      set -g base-index 1
      setw -g pane-base-index 1

      ## source: https://hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/
      setw -g clock-mode-colour yellow
      ## panes
      set -g pane-border-style 'fg=maroon'
      set -g pane-active-border-style 'fg=yellow'
      ## Status Bar 
      set-option -g status-position top
      set -g status-justify left
      set -g status-left-length 50
      setw -g window-status-format ' #W #I ' # name, then number
      set -g status-style 'fg=maroon'
      set -g status-left '#{?client_prefix,#[bg=maroon fg=black],#[bg=yellow fg=black]} #(whoami) on #(uname) '

      ## Current Stuff
      setw -g window-status-current-style 'bg=yellow'
      setw -g window-status-current-format ' #W #I '
      setw -g window-status-separator \'\'

      set -g status-right-style 'fg=black bg=yellow'
      set -g status-right ' %Y-%m-%d %H:%M '
      set -g status-right-length 50

      set -g message-style 'fg=maroon bg=terminal bold'
    '';
  };	
}
