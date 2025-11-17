{ lib, ... }: {

  imports = [

    # ASTRONAUT
    ../astronauts/g8.nix

    # ORBITS
    ../orbits/dev
    ../orbits/neovim
    ../orbits/terminals/kitty.nix

  ];

  stylix.image = lib.mkForce ./modules/common/custom/wallpapers/default.png;

}

