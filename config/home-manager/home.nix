{ config, pkgs, ...} : {
  home.username = "ddd";
  home.homeDirectory = "/home/ddd";
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
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
        sensible
        yank
        {
          plugin = dracula;
          extraConfig = ''
            set -g @dracula-show-battery false
            set -g @dracula-show-powerline true
            set -g @dracula-refresh-rate 10
            '';
        }
    ];

    extraConfig = ''
      set -g mouse on
      '';
  };
}

