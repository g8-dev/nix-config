{ config, pkgs, lib, ... }:
let
  domain = "opencloud.g8-space.com.br";
  localDomain = "127.0.0.1";
in {
  services.opencloud = {
    enable = true;
    url = "https://${domain}";
    port = 9101;
    environment = {
      OC_INSECURE = "false";
      PROXY_TLS = "false";
      PROXY_INSECURE_BACKENDS = "true";
    };
    settings = {
      proxy = {
        auto_provision_accounts = true;
        oidc = { rewrite_well_known = true; };
        role_assignment = {
          driver = "oidc";
          oidc_role_mapper = { role_claim = "opencloud_roles"; };
        };
      };
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

