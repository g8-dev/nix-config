{ config, lib, inputs, outputs, pkgs, ... }: {
  imports = [ ];

  nix = {
    settings = {
      trusted-users = [ "@admin" "root" "@wheel" ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
    optimise.automatic = true;
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [ ];
    };
  };

  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  time.timeZone = lib.mkDefault "America/Sao_Paulo";

  programs.zsh.enable = true;

}
