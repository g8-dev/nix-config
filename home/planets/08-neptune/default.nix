{ lib, ... }:
{

  imports = [

    # ASTRONAUT
    ../../astronauts/g8.nix

    # ORBITS

    ../../orbits/interfaces/DE/kde.nix

    ../../orbits/cli
    ../../orbits/neovim
    ../../orbits/programs
    ../../orbits/services
    ../../orbits/dev

  ];

  # wayland.windowManager.hyprland.settings.input = {
  #   kb_layout = "br";
  #   kb_variant = "abnt2";
  # };

  stylix.image = ./neptune.png;
}
