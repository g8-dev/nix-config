{ lib, ... }: {

  imports = [

    # ASTRONAUT
    ../astronauts/g8.nix

    # ORBITS
    ../orbits/browsers/firefox.nix
    ../orbits/browsers/chromium.nix
    ../orbits/cli
    ../orbits/programs
    ../orbits/services
    ../orbits/terminals/kitty.nix
    ../orbits/neovim
  ];

  stylix.image = lib.mkForce ../orbits/custom/wallpapers/uranus.jpeg;

  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "br";
    kb_variant = "abnt2";
  };
}
