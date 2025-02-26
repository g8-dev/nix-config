{ config, ... }: {
  services = {
    cloudflared = {
      enable = true;
      user = "guifuentes8";
      tunnels = {
        "c01587a3-9801-48f1-96a1-6f9fdd900259" = {
          credentialsFile =
            "${config.users.users.guifuentes8.home}/.cloudflared/c01587a3-9801-48f1-96a1-6f9fdd900259.json";
          default = "http_status:404";
        };
      };
    };
  };
  environment.systemPackages = [ pkgs.unstable.cloudflared ];
}
