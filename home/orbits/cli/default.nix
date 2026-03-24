{ pkgs, config, ... }:
{

  imports = [
    ./himalaya.nix
    ./khal.nix
    ./ncspot.nix
  ];
  programs = {
    bat = {
      enable = true;
      #extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
    };
    bottom = {
      enable = true;
      package = pkgs.bottom;
      settings = {
        flags = {
          temperature_type = "c";
          rate = 500;
        };
      };
    };
    feh.enable = true;
    jq.enable = true;
    lsd.enable = true;
    ncmpcpp = {
      package = pkgs.ncmpcpp.override { visualizerSupport = true; };
      enable = false;
      # mpdMusicDir = "${config.home.homeDirectory}/Nextcloud/Music";
    };
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
    clock-rs
    cmatrix # matrix
    dipc # palette wallpaper converter
    devour # hide terminal
    epr # E-pub reader
    girouette # Weather
    pastel # color cli
    nitch # fetch system settings
    nix-search-cli # search cli nix
    speedtest-rs # Networking test
    tgpt # chatgpt
    tuifeed # feed
  ];

}
