{ config, pkgs, ... }: {
  services = {
    cloudflared = {
      enable = true;
      package = pkgs.cloudflared;
    };
  };
  environment.systemPackages = [ pkgs.cloudflared ];
}
