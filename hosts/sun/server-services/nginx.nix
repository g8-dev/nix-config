{ config, ... }:
let
  domain = "g8-space.com.br";
  localDomain = "127.0.0.1";
in {
  services = {
    #######################################
    ## 🔹 NGINX - apenas HTTP interno
    #######################################
    nginx = {
      enable = true;
      recommendedGzipSettings = true;
      recommendedProxySettings = true;

      # Nenhum HTTPS local — tudo via túnel
      virtualHosts = {
        "${domain}" = { # Homer
          locations."/" = { proxyPass = "http://${localDomain}:9000"; };
        };

        "opencloud.${domain}" = { # OpenCloud
          locations."/" = { proxyPass = "https://${localDomain}:9100"; };
          extraConfig = ''
            proxy_ssl_verify off;  # se o certificado for autoassinado
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };

        "immich.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9102"; };
        };

        "radicale.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9103"; };
        };

        "navidrome.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9104"; };
        };

        "audiobookshelf.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9105"; };
        };

        "flatnotes.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9106"; };
        };

        "convertx.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9107"; };
        };

        "metube.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9108"; };
        };

        "karakeep.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9109"; };
        };

        "vaultwarden.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9110"; };
        };

        "vscode.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9111"; };
        };

        "vikunja.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9112"; };
        };

        "excalidraw.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9113"; };
        };

        "gitea.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9114"; };
        };

        "onlyoffice.${domain}" = {
          locations."/" = { proxyPass = "http://${localDomain}:9115"; };
        };
      };
    };

    #######################################
    ## 🔹 CLOUDFLARE TUNNEL
    #######################################
    cloudflared.tunnels = {
      "207e94f5-b501-430a-837d-1dec128c2139" = {
        credentialsFile =
          "${config.users.users.g8.home}/.cloudflared/207e94f5-b501-430a-837d-1dec128c2139.json";

        ingress = {
          "${domain}" = { service = "http://${localDomain}:9000"; };
          "opencloud.${domain}" = { service = "http://${localDomain}:9101"; };
          "immich.${domain}" = { service = "http://${localDomain}:9102"; };
          "radicale.${domain}" = { service = "http://${localDomain}:9103"; };
          "navidrome.${domain}" = { service = "http://${localDomain}:9104"; };
          "audiobookshelf.${domain}" = {
            service = "http://${localDomain}:9105";
          };
          "flatnotes.${domain}" = { service = "http://${localDomain}:9106"; };
          "convertx.${domain}" = { service = "http://${localDomain}:9107"; };
          "metube.${domain}" = { service = "http://${localDomain}:9108"; };
          "karakeep.${domain}" = { service = "http://${localDomain}:9109"; };
          "vaultwarden.${domain}" = { service = "http://${localDomain}:9110"; };
          "vscode.${domain}" = { service = "http://${localDomain}:9111"; };
          "vikunja.${domain}" = { service = "http://${localDomain}:9112"; };
          "excalidraw.${domain}" = { service = "http://${localDomain}:9113"; };
          "gitea.${domain}" = { service = "http://${localDomain}:9114"; };
          "onlyoffice.${domain}" = { service = "http://${localDomain}:9115"; };
        };

        default = "http_status:404";
      };
    };
  };
}

