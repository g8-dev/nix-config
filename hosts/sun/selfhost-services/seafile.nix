{ config, pkgs, lib, ... }:
let
  domain = "teste.g8-space.com.br";
  localDomain = "127.0.0.1";
in {
  services.opencloud = {
    enable = true;
    port = 9400;
    url = "https://${domain}";
    stateDir = "/var/lib/storage/opencloud";
    environment = {
      INSECURE = "false";
      OC_DOMAIN = "https://${domain}";
      INITIAL_ADMIN_PASSWORD = "Agorajaera@123";
    };
    settings = {
      web = {
        web = {
          config = {
            oidc = { scope = "openid profile email opencloud_roles"; };
          };
        };
      };
    };
  };
}

