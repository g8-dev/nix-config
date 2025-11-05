{ config, pkgs, ... }:
let
  domain = "g8-space.com.br";
  localDomain = "127.0.0.1";
in {
  ########################################
  ## 🔹 ACME Self-Signed Certificates
  ########################################
  security.acme = {
    acceptTerms = true;
    defaults.email = "admin@${domain}";
    certs = {
      "${domain}" = {
        domain = "*.${domain}";
        allowSelfSigned = true;
        dnsProvider = null;
      };
    };
  };

  ########################################
  ## 🔹 Nginx Reverse Proxy
  ########################################
  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedProxySettings = true;

    virtualHosts = {
      "${domain}" = { # homer
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9000"; };
      };

      "opencloud.${domain}" = { # opencloud
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9101"; };
      };

      "immich.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9102"; };
      };

      "radicale.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9103"; };
      };

      "navidrome.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9104"; };
      };

      "audiobookshelf.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9105"; };
      };

      "flatnotes.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9106"; };
      };

      "convertx.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9107"; };
      };

      "metube.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9108"; };
      };

      "karakeep.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9109"; };
      };

      "vaultwarden.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9110"; };
      };

      "vscode.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9111"; };
      };

      "vikunja.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9112"; };
      };

      "excalidraw.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9113"; };
      };

      "gitea.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9114"; };
      };

      "onlyoffice.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = { proxyPass = "http://${localDomain}:9115"; };
      };
    };
  };

  ########################################
  ## 🔹 Cloudflare Tunnel
  ########################################
  services.cloudflared.tunnels = {
    "207e94f5-b501-430a-837d-1dec128c2139" = {
      credentialsFile =
        "${config.users.users.g8.home}/.cloudflared/207e94f5-b501-430a-837d-1dec128c2139.json";

      default = "http_status:404";
    };
  };
}

