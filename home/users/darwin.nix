{ lib, pkgs, outputs, ... }:

{

  imports = [
    ../modules/common/programs.nix
    ../modules/common/services.nix
    ../modules/common/sops.nix
    ../modules/common/sops-darwin.nix
    ../modules/common/stylix.nix
    ../modules/features/neovim
    ../modules/features/dev
    ../modules/features/cli
    ../modules/features/programs/vscode.nix
    ../modules/features/terminals/ghostty.nix
    ../modules/features/browsers/firefox.nix

  ];

  home = {
    username = "administrador";
    homeDirectory = "/Users/administrador";
    stateVersion = "25.11";
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    overlays = [
      (self: super: {
        nodejs = super.nodejs_22;
        nodejs-slim = super.nodejs-slim_22;
      })
    ] ++ builtins.attrValues outputs.overlays;

    config = {
      allowUnfree = true;
      permittedInsecurePackages = [ ];
    };
  };

  systemd.user.startServices = "sd-switch";
  news.display = "silent";

  targets.darwin.copyApps.enable = true;

}
