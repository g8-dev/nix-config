{ lib, ... }: {

  imports = [

    # ASTRONAUT
    ../astronauts/g8.nix

    # ORBITS
    ../orbits/dev
    ../orbits/neovim
    ../orbits/terminals/kitty.nix

  ];

  stylix.image = lib.mkForce ../orbits/custom/wallpapers/default.png;

}

