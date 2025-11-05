{ pkgs, config, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common/boot/systemd-boot.nix
    ../common/users/g8.nix

    ./selfhost-services/homepage-dashboard.nix

    # External services selfhosted
    ./selfhost-services/docker-services.nix
    ./selfhost-services/immich.nix
    ./selfhost-services/karakeep.nix
    ./selfhost-services/navidrome.nix

    ./selfhost-services/audiobookshelf.nix
    ./selfhost-services/gitea.nix
    ./selfhost-services/radicale.nix
    ./selfhost-services/opencloud.nix
    ./selfhost-services/vikunja.nix
    ./selfhost-services/vaultwarden.nix
    #   ./selfhost-services/postiz.nix

    #/server    ./jackett.nix
    #/server    ./sonarr.nix
    #/server    ./radarr.nix
    #/server    ./lidarr.nix
    ./selfhost-services/vscode-server.nix

    # Server 
    ./server-services/console.nix
    ./server-services/nginx.nix
    ./server-services/cloudflare.nix
    ./server-services/networking.nix
    ./server-services/postgres.nix
    ./server-services/tailscale.nix
  ];
  services.getty.autologinUser = "g8";
  services.openssh.enable = true;

  fileSystems."/var/lib/storage_backup" = {
    device = "/dev/disk/by-uuid/433cc6cc-561e-4783-b33c-d523378eefd9";
    fsType = "ext4";
    depends = [ "/var/lib/storage" ];
    options = [ "nofail" "users" "rw" ];
  };
  fileSystems."/var/lib/storage" = {
    device = "/dev/disk/by-uuid/b22affd9-1505-4214-8acf-57468a600899";
    fsType = "ext4";
    options = [ "users" "nofail" "rw" ];
  };

}
