{ config, ... }:
let
  domain = "g8-space.com.br";
  localDomain = "127.0.0.1";
in {
  services = {
    nginx = {
      enable = true;

      recommendedGzipSettings = true;
      recommendedProxySettings = true;

      virtualHosts = {
        "${domain}" = { # homer
          locations."/" = { proxyPass = "http://${localDomain}:9000"; };
        };

        "opencloud.${domain}" = { # opencloud
          locations."/" = {
            proxyWebsockets = true;
            proxyPass = "http://${localDomain}:9101";
          };
        };

        "immich.${domain}" = { # immich
          locations."/" = { proxyPass = "http://${localDomain}:9102"; };
        };

        "radicale.${domain}" = { # radicale
          locations."/" = { proxyPass = "http://${localDomain}:9103"; };
        };

        "navidrome.${domain}" = { # navidrome
          locations."/" = { proxyPass = "http://${localDomain}:9104"; };
        };

        "audiobookshelf.${domain}" = { # audiobookshelf
          locations."/" = { proxyPass = "http://${localDomain}:9105"; };
        };

        "flatnotes.${domain}" = { # flatnotes
          locations."/" = { proxyPass = "http://${localDomain}:9106"; };
        };

        "convertx.${domain}" = { # convertx
          locations."/" = { proxyPass = "http://${localDomain}:9107"; };
        };

        "metube.${domain}" = { # metube
          locations."/" = { proxyPass = "http://${localDomain}:9108"; };
        };

        "karakeep.${domain}" = { # karakeep
          locations."/" = { proxyPass = "http://${localDomain}:9109"; };
        };

        "vaultwarden.${domain}" = { # vaultwarden
          locations."/" = { proxyPass = "http://${localDomain}:9110"; };
        };

        "vscode.${domain}" = { # vscode
          locations."/" = { proxyPass = "http://${localDomain}:9111"; };
        };

        "vikunja.${domain}" = { # vikunja
          locations."/" = { proxyPass = "http://${localDomain}:9112"; };
        };

        "excalidraw.${domain}" = { # excalidraw
          locations."/" = { proxyPass = "http://${localDomain}:9113"; };
        };

        "gitea.${domain}" = { # gitea
          locations."/" = { proxyPass = "http://${localDomain}:9114"; };
        };

        "onlyoffice.${domain}" = { # onlyoffice
          locations."/" = { proxyPass = "http://${localDomain}:9115"; };
        };
      };
    };

    cloudflared.tunnels = {
      "207e94f5-b501-430a-837d-1dec128c2139" = {
        credentialsFile =
          "${config.users.users.g8.home}/.cloudflared/207e94f5-b501-430a-837d-1dec128c2139.json";

        ingress = {
          "${domain}" = { service = "http://${localDomain}:9000"; };
          "seafserver.${domain}" = { service = "http://${localDomain}:9100"; };
          "cloud.${domain}" = { service = "http://${localDomain}:9101"; };
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
        };

        default = "http_status:404";
      };
    };
  };
}

