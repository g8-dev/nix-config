{ pkgs, ... }: {
  imports =
    [ ./default.nix ./picom.nix ./polybar.nix ./i3lock.nix ./sxhkd.nix ];

  services = { flameshot.enable = true; };

  home.packages = with pkgs; [ lxappearance xclip xcolor rofi-rbw ];
}
