{ lib, pkgs, config, outputs, ... }: {
  imports = [
    ../modules/common/programs.nix
    ../modules/common/services.nix
    ../modules/common/stylix.nix
    ../modules/common/sops.nix
  ];
  home = {
    username = "g8";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "25.05";
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${config.home.homeDirectory}/Music";
      videos = "${config.home.homeDirectory}/Videos";
      pictures = "${config.home.homeDirectory}/Pictures";
      download = "${config.home.homeDirectory}/Downloads";
      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      extraConfig = {
        work = "${config.home.homeDirectory}/Work";
        fonts = "${config.home.homeDirectory}/.local/share/fonts";
      };
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [ "ventoy-1.1.07" ];
    };
  };

  fonts.fontconfig.enable = true;
  systemd.user.startServices = "sd-switch";
  news.display = "silent";

  stylix.image = ../modules/common/extras/eevee.png;
}

