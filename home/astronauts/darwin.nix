{ lib, pkgs, outputs, ... }: {

  imports = [
    ../missions/common/programs.nix
    ../missions/common/services.nix
    ../missions/common/sops.nix
    ../missions/common/sops-darwin.nix
    ../missions/common/stylix.nix
  ];

  home = {
    username = "administrador";
    homeDirectory = "/Users/administrador";
    stateVersion = "26.05";
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [ ];
    };
    overlays = [
      (self: super: {
        nodejs = super.nodejs_22;
        nodejs-slim = super.nodejs-slim_22;
      })
    ] ++ builtins.attrValues outputs.overlays;

  };

  news.display = "silent";
  targets.darwin.copyApps.enable = true;
  systemd.user.startServices = "sd-switch";

}
