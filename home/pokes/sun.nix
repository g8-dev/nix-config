{ lib, ... }:
{

  imports = [

    # ASTRONAUT
    ../astronauts/g8.nix

    # ORBITS

    ../orbits/cli
    ../orbits/dev
    ../orbits/neovim
    ../orbits/terminals/kitty.nix

  ];

}
