{ ... }:

{
  imports = [ ./dunst.nix ./mpv.nix ./rofi ./xdg.nix ];

  # Common programs Windows Managers
  programs = { zathura.enable = true; };
}
