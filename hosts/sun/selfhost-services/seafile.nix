{ config, pkgs, lib, ... }:
let
  domain = "opencloud.g8-space.com.br";
  localDomain = "127.0.0.1";
in {
  services.opencloud = {
    enable = true;
    url = "https://${domain}";
    port = 9101;
  };
}

