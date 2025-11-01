{ config, pkgs, lib, ... }:
let
  domain = "seafile.g8-space.com.br";
  localDomain = "127.0.0.1";
in {
  services.seafile = {
    enable = true;
    seahubPackage = pkgs.unstable.seahub;
    dataDir = "/var/lib/storage/seafile-server/data";
    adminEmail = "admin@example.com";
    initialAdminPassword = "Agorajaera@123";
    ccnetSettings.General = { SERVICE_URL = "https://${domain}"; };
    seafileSettings.fileserver = {
      host = "${localDomain}";
      port = 9100;
    };
    seahubAddress = "${localDomain}:9101";
    seahubExtraConf = ''
      ALLOWED_HOSTS = ['${domain}', '${localDomain}']
      CSRF_TRUSTED_ORIGINS = ['https://${domain}', 'http://${localDomain}']
      FILE_SERVER_ROOT = 'https://${domain}/seafhttp'

    '';
    gc = {
      enable = true;
      dates = [ "Sun 03:00:00" ];
    };
    workers = 12;
  };
}

