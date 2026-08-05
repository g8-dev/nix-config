{ lib, ... }:

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

  system.stateVersion = lib.mkDefault "24.05";

  # insert Nix-on-Droid config

  home-manager.config =
    { pkgs, lib, ... }:
    {
      # Read home-manager changelog before changing this value
      home.stateVersion = lib.mkDefault "24.05";

      # insert home-manager config
      home-manager.config = ../../astronauts/g8.nix;
    };

}
