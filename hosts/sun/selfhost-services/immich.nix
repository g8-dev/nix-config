{ pkgs, ... }: {
  services.immich = {
    enable = true;
    package = pkgs.immich;
    host = "127.0.0.1";
    port = 9102;
    openFirewall = true;
    mediaLocation = "/var/lib/storage/immich";
    accelerationDevices = null;
  };
  users.users.immich.extraGroups = [ "video" "render" ];
  environment.systemPackages = [ pkgs.immich-cli ];
}
