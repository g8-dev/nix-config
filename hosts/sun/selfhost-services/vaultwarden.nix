{ ... }: {
  services.vaultwarden = {
    enable = true;
    backupDir = "/var/lib/storage/vaultwarden";
    config = {
      DOMAIN = "https://vaultwarden.guifuentes8.com.br";
      SIGNUPS_ALLOWED = false;

      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 9110;

      ROCKET_LOG = "critical";

      # This example assumes a mailserver running on localhost,
      # thus without transport encryption.
      # If you use an external mail server, follow:
      #   https://github.com/dani-garcia/vaultwarden/wiki/SMTP-configuration
      SMTP_HOST = "127.0.0.1";
      SMTP_PORT = 25;
      SMTP_SSL = false;

      SMTP_FROM = "admin@bitwarden.example.com";
      SMTP_FROM_NAME = "example.com Bitwarden server";
    };
  };
}
