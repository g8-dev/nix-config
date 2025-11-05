{ config, ... }:
let
  domain = "g8-space.com.br";
  localDomain = "127.0.0.1";
  caddyConfig = ''
    encode gzip zstd 
  '';
in {
  services = {
    caddy = {
      enable = true;
      extraConfig = "";
      virtualHosts = {
        "${domain}" = { # homer
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy  ${localDomain}:9000  
          '';
        };

        "teste.${domain}" = { # seafile
          extraConfig = ''
            ${caddyConfig}
              reverse_proxy ${localDomain}:9400
          '';
        };

        "immich.${domain}" = { # immich
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9102
          '';
        };
        "radicale.${domain}" = { # radicale
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9103
          '';
        };
        "navidrome.${domain}" = { # navidrome
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9104
          '';
        };
        "audiobookshelf.${domain}" = { # audiobookshelf
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9105
          '';
        };

        "flatnotes.${domain}" = { # flatnotes
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9106
          '';
        };
        "convertx.${domain}" = { # convertx
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9107
          '';
        };
        "metube.${domain}" = { # metube
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9108
          '';
        };

        "karakeep.${domain}" = { # karakeep
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9109
          '';
        };

        "vaultwarden.${domain}" = { # vaultwarden
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9110
          '';
        };
        "vscode.${domain}" = { # vscode
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9111
          '';
        };

        "vikunja.${domain}" = { # vikunja
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9112
          '';
        };

        "excalidraw.${domain}" = { # excalidraw
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9113
          '';
        };
        "gitea.${domain}" = { # gitea
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9114
          '';
        };
        "onlyoffice.${domain}" = { # onlyoffice
          extraConfig = ''
            ${caddyConfig}
            reverse_proxy ${localDomain}:9115
          '';
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
          "seafile.${domain}" = { service = "http://${localDomain}:9101"; };
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
