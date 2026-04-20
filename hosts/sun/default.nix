{
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common/boot/systemd-boot.nix
    ../common/users/g8.nix

    ../stylix.nix

    ./selfhost-services/homepage-dashboard.nix
    #
    ./selfhost-services/docker-services.nix
    #    # External services selfhosted
    ./selfhost-services/ollama.nix
    ./selfhost-services/nextcloud.nix
    ./selfhost-services/immich.nix
    ./selfhost-services/navidrome.nix

    ./selfhost-services/radicale.nix
    ./selfhost-services/audiobookshelf.nix
    ./selfhost-services/karakeep.nix
    ./selfhost-services/vaultwarden.nix
    ./selfhost-services/vscode-server.nix
    ./selfhost-services/vikunja.nix
    ./selfhost-services/gitea.nix
    #
    #
    #    #/server    ./jackett.nix
    #    #/server    ./sonarr.nix
    #    #/server    ./radarr.nix
    #    #/server    ./lidarr.nix
    #
    #    # Server
    ./server-services/console.nix
    ./server-services/nginx.nix
    ./server-services/cloudflare.nix
    ./server-services/networking.nix
    ./server-services/postgres.nix
    ./server-services/tailscale.nix
  ];
  services.getty.autologinUser = "g8";
  services.openssh.enable = true;

  boot = {

    #   initrd.kernelModules = [ "nvidia" ];
    # kernelParams = [
    #   "nvidia-drm.modeset=1"
    #   "nomodeset"
    #];
    # extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    blacklistedKernelModules = [ "nouveau" ];
  };

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
      nvidiaSettings = false;
      open = false;
    };
  };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;

  fileSystems."/var/lib/storage_backup" = {
    device = "UUID=433cc6cc-561e-4783-b33c-d523378eefd9";
    fsType = "ext4";
    depends = [ "/var/lib/storage" ];
    options = [ "defaults" ];
  };

  fileSystems."/var/lib/storage" = {
    device = "UUID=b22affd9-1505-4214-8acf-57468a600899";
    fsType = "ext4";
    options = [ "defaults" ];
  };

}
