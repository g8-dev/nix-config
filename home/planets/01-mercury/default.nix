{ lib, inputs, ... }:

{
  imports = [
    ../../astronauts/g8.nix
    ../../orbits/cli
    ../../orbits/neovim

    inputs.sops-nix.homeModules.sops
    inputs.stylix.homeModules.stylix
    inputs.nixvim.homeModules.nixvim

  ];

  home.stateVersion = lib.mkDefault "24.05";
  nixpkgs.config = {
    allowUnfree = true;
  };

  stylix.image = ./mercury.png;
  targets.genericLinux.enable = true;

}
