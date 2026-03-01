{ lib, ... }:
{

  imports = [

    # ASTRONAUT
    ../astronauts/g8.nix

    # ORBITS
    ../orbits/interfaces/WM/hyprland.nix

    ../orbits/cli
    ../orbits/neovim
    ../orbits/programs
    ../orbits/services

    ../orbits/browsers/firefox.nix
    ../orbits/browsers/chromium.nix
    ../orbits/terminals/kitty.nix

  ];

  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "us";
    # kb_variant = "abnt2";
  };

  stylix.image = lib.mkForce ../orbits/custom/wallpapers/neptune.jpeg;

}
