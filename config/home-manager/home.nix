{ config, pkgs, ...} : {
  home.username = "ddd";
  home.homeDirectory = "/home/ddd";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "dandeandean";
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
}

