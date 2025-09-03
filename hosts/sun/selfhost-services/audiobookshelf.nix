{ ... }: {
  services.audiobookshelf = {
    enable = true;
    openFirewall = true;
    port = 9105;
    dataDir =
      "storage/audiobookshelf"; # /var/lib is considered the initial path
  };
}
