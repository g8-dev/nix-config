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
  targets.genericLinux.enable = true;

  stylix.image = ./mercury.png;

}
