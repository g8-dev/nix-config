{ pkgs, lib, config, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "kitty";
    theme = (import ./theme.nix { inherit config lib; });
    plugins = with pkgs.unstable; [
      rofi-bluetooth
      rofi-emoji
      rofi-power-menu
      rofi-pulse-select
      rofi-systemd
    ];
  };

  home.packages = with pkgs.unstable; [
    rofi-bluetooth
    rofi-calc
    rofi-emoji
    rofi-power-menu
    rofi-pulse-select
    rofi-systemd
  ];

  programs.rbw = {
    enable = true;
    package = pkgs.unstable.rbw;
    settings = {
      pinentry = pkgs.pinentry-gnome3;
      base_url = "https://vault.g8-space.com.br";
      email = "guifuentes8@gmail.com";
    };
  };

}
