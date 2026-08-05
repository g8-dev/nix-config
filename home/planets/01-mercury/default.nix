{ ... }:

{
  imports = [
    ../../astronauts/g8.nix
    ../../orbits/cli
    ../../orbits/neovim

  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  stylix.image = ./mercury.png;
  targets.genericLinux.enable = true;

}
