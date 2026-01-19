{ ... }:

{
  imports = [
    ./dunst.nix
    ./mpv.nix
    ./rofi
  ];

  # Common programs Windows Managers
  programs = {
    zathura.enable = true;
  };
}
