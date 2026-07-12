{ pkgs, ... }: {
  services.transmission = {
    enable = true;
    downloadDirPermissions = "755";
    webHome = pkgs.flood-for-transmission;
    openFirewall = true;
    user = "transmission";
    openPeerPorts = true;
    openRPCPort = true; # Open firewall for RPC
    settings = {
      peer-port = 51413;
      rpc-authentication-required = false;
      rpc-host-whitelist-enabled = false;
      rpc-whitelist-enabled = false;
      rpc-bind-address = "0.0.0.0"; # Bind to own IP
      rpc-port = 9023;
      rpc-whitelist =
        "127.0.0.1,10.10.10.*,192.168.*,100.*.*.*, torrent.guifuentes8.com.br"; # Whitelist your remote machine (10.0.0.1 in this example)
      download-dir =
        "/var/lib/storage/nextcloud/data/guifuentes8/files/Torrents";
      ratio-limit = 0;
      ratio-limit-enabled = true;
    };
  };

}
