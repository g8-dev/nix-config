{ config, pkgs, ... }:
{
  imports = [ ];
  home.packages = [ pkgs.sops ];
  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    secrets = {
      github-login-token.path = "${config.sops.defaultSymlinkPath}/github-login-token";
      caldav-password.path = "${config.sops.defaultSymlinkPath}/caldav-password";
      gmail-g8-password.path = "${config.sops.defaultSymlinkPath}/gmail-g8-password";
      gmail-gcf-password.path = "${config.sops.defaultSymlinkPath}/gmail-gcf-password";
      gpt-api-key.path = "${config.sops.defaultSymlinkPath}/gpt-api-key";
    };
  };
  systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];
}
