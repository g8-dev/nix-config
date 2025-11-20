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

    ../common/interfaces/WM/hyprland.nix
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
  # Set the keyboard layout for Xorg (initial setting for GNOME)
  services.xserver.xkb.layout = "br";
  services.xserver.xkb.variant = "abnt2";

  networking.hostName = "uranus";

  # garante diretório e permissões
  systemd.tmpfiles.rules = [
    "d /var/lib/opencloud 0755 opencloud opencloud -"
    "d /var/lib/opencloud/config 0755 opencloud opencloud -"
  ];
}
