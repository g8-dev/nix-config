{ config, pkgs, ... }: {
  services = {
    cloudflared = {
      enable = true;
      package = pkgs.unstable.cloudflared;
    };
  };
  environment.systemPackages = [ pkgs.unstable.cloudflared ];
}
