{ pkgs, ... }: {
  imports = [

    # HARDWARE ----------------------------------------

    # Hardware config (required)
    ./hardware-configuration.nix
    ../common/hardware/bluetooth.nix
    ../common/hardware/logitech.nix

    # Hardware Gpu (if exist)

    # NIXOS CONFIG ------------------------------------

    # global NixOs Config 
    ../common

    # Boot initial (grub or systemd)
    ../common/boot/grub.nix

    # Login Manager
    ../common/login/gdm.nix

    # Choice Interface (WM and/or DE)
    ../common/interfaces/DE/gnome.nix

    # Active services
    ../common/services/backlight.nix
    ../common/services/flatpak.nix

    ../common/services/temperature.nix
    ../common/services/dev

    ../common/services/gaming.nix

    # User 
    ../common/users/g8.nix
    ../stylix.nix

  ];

  # SYSTEM CONFIGS --------------------------------------

  console.keyMap = "br-abnt2";
  services.xserver.xkb.layout = "br";
  services.xserver.xkb.variant = "abnt2";
  networking.hostName = "uranus";

  services.opencloud = {
    enable = true;
    port = 9200;
    # diretório onde o OpenCloud armazenará arquivos e config
    stateDir = "/var/lib/opencloud";
    environment = {
      OC_URL = "https://192.168.0.213:9200";
      OC_INSECURE = "true";
      PROXY_HTTP_ADDR = "0.0.0.0:9200";

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
