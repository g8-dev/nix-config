{ config, pkgs, ... }:

{
  services.opencloud = {
    enable = true;
    port = 9100;
    # diretório onde o OpenCloud armazenará arquivos e config
    stateDir = "/var/lib/opencloud";
    environment = {
      OC_URL = "https://opencloud.g8-space.com.br";
      OC_INSECURE = "true";
      PROXY_HTTP_ADDR = "0.0.0.0:9100";
      OC_DOMAIN = "opencloud.g8-space.com.br";
      INITIAL_ADMIN_PASSWORD = "admin123";

      # endereço interno para o Cloudflare Tunnel acessar

      # garante que o runtime saiba onde escrever logs
      OC_LOG_LEVEL = "debug";
      OC_LOG_COLOR = "false";
    };
  };

  # garante diretório e permissões
  systemd.tmpfiles.rules = [
    "d /var/lib/opencloud 0755 opencloud opencloud -"
    "d /var/lib/opencloud/config 0755 opencloud opencloud -"
  ];
}

