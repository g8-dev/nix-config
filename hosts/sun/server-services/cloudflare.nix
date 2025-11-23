{ config, pkgs, domain, ... }:
let localDomain = "127.0.0.1";
in {
  services = {
    cloudflared = {
      enable = true;
      tunnels = {
        "490ec411-4a95-45fb-9197-06c13d9dcc19" = {
          credentialsFile =
            "${config.users.users.g8.home}/.cloudflared/490ec411-4a95-45fb-9197-06c13d9dcc19.json";

          ingress = {
            "${domain}" = { service = "http://${localDomain}:9000"; };
            "nextcloud.${domain}" = { service = "http://${localDomain}:9101"; };
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
            "vaultwarden.${domain}".service = "http://${localDomain}:9110";
            "vscode.${domain}" = { service = "http://${localDomain}:9111"; };
            "vikunja.${domain}" = { service = "http://${localDomain}:9112"; };
            "excalidraw.${domain}" = {
              service = "http://${localDomain}:9113";
            };
            "gitea.${domain}" = { service = "http://${localDomain}:9114"; };
            "onlyoffice.${domain}" = {
              service = "http://${localDomain}:9115";
            };
          };

          default = "http_status:404";
        };
      };

    };
  };
  environment.systemPackages = [ pkgs.cloudflared ];

}
