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
    ../orbits/dev

    ../orbits/browsers/chromium.nix
    ../orbits/browsers/firefox.nix
    ../orbits/terminals/kitty.nix
  ];

  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "br";
    kb_variant = "abnt2";
  };
}
