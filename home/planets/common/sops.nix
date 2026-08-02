{ config, pkgs, ... }:
{
  imports = [ ];
  home.packages = [ pkgs.sops ];
  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../../secrets/common.yaml;
    defaultSopsFormat = "yaml";
    secrets = {
      github-token = {};
    };
  };
  systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];
}
