{ pkgs, config, ... }: {

  imports = [ ./ncspot.nix ];
  programs = {
    bat = {
      enable = true;
      #extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
    };
    bottom = {
      enable = true;
      settings = {
        flags = {
          temperature_type = "c";
          rate = 500;
        };
      };
    };
    #cava.enable = true;
    feh.enable = true;
    jq.enable = true;
    lsd.enable = true;
    ncmpcpp = {
      package = pkgs.ncmpcpp.override { visualizerSupport = true; };
      enable = false;
      # mpdMusicDir = "${config.home.homeDirectory}/Nextcloud/Music";
    };
    ncspot.enable = true;
    rtorrent.enable = true;
    translate-shell.enable = true;
    yt-dlp.enable = true;
    yazi = {
      enable = true;
      package = pkgs.yazi;
      enableZshIntegration = true;
      keymap = { };
      settings = { };
      theme = { };
    };
  };

  home.packages = with pkgs; [
    nix-search-cli # search cli nix
    cmatrix # matrix
    dipc # palette wallpaper converter
    devour # hide terminal
    epr # E-pub reader
    girouette # Weather
    pastel # color cli
    speedtest-rs # Networking test
    clock-rs
    tgpt # chatgpt
    tuifeed # feed
  ];

}
