{ config, inputs, outputs, pkgs, ... }: {

  imports = [ ../../common ];

  users.users.administrador = {
    name = "administrador";
    home = "/Users/administrador";
  };

  system.primaryUser = "administrador";
  system.stateVersion = 6;
  nixpkgs.hostPlatform.system = "aarch64-darwin";

  nix = {
    linux-builder.enable = false;
    settings = {
      trusted-users = [ "@admin" "administrador" "root" "@wheel" ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
    gc.automatic = true;
    extraOptions = ''
      ssl-cert-file = /etc/nix/ca_cert.pem
      extra-platforms = x86_64-linux x86_64-darwin aarch64-darwin
    '';
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    casks = [
      "alfred"
      "bitwarden"
      "caffeine"
      "discord"
      "docker-desktop"
      "dbeaver-community"
      "gimp"
      "microsoft-teams"
      "nextcloud"
      "onlyoffice"
      "pika"
      "spotify"
      # "tailscale"
      "obs"
      "zoom"

    ];
  };

  home-manager.backupFileExtension = "backup";

}
