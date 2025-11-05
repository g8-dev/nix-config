{ config, pkgs, ... }:

{
  services.opencloud = {
    enable = true;
    package = pkgs.opencloud;
    url = "https://opencloud.g8-space.com.br";
    user = "opencloud";
    group = "opencloud";
    port = 9200;
    environmentFile = "/etc/opencloud/env";
  };

  # Cria o arquivo .env
  environment.etc."opencloud/env".text = ''
    OCIS_URL=https://opencloud.g8-space.com.br
    OCIS_BASE_DATA_PATH=/var/lib/opencloud
    OCIS_CONFIG_DIR=/var/lib/opencloud/config
    OC_HTTP_TLS_ENABLED=false
    OCIS_INSECURE=false
    OCIS_LOG_LEVEL=debug
    OCIS_LOG_COLOR=false
  '';

  # Garante permissões e diretórios
  systemd.tmpfiles.rules = [
    "d /var/lib/opencloud 0755 opencloud opencloud -"
    "d /var/lib/opencloud/config 0755 opencloud opencloud -"
  ];
}

