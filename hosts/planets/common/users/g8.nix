{
  config,
  lib,
  inputs,
  outputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../common
    ../sops.nix
  ];
  users.users.g8-fuentes = {
    isNormalUser = true;
    description = "g8-fuentes";
    extraGroups = [
      "networkmanager"
      "wheel"
      "sudo"
      "video"
      "docker"
      "podman"
      "adbusers"
      "input"
      "vboxusers"
      "nextcloud"
      "vaultwarden"
      "storage"
      "libvirtd"
      "cloudflared"
      "media"
      "vaultwarden"
      "writefreely"
      "caddy"
      "tailscale"
    ];
    shell = pkgs.zsh;
  };

  programs = {
    dconf.enable = true;
    git.enable = true;
    partition-manager.enable = true;
    nh = {
      enable = true;
      clean.enable = true;
      flake = "${config.users.users.g8-fuentes.home}/nix-config";
    };
  };

  services = {
    tailscale.enable = true;
    tailscale.package = pkgs.tailscale;
    tailscale.openFirewall = true;
    tailscale.useRoutingFeatures = "client";
    dbus = {
      enable = true;
      packages = [ pkgs.gcr ];
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [ sops ];
    sessionVariables = {
      
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
      # PATH = [ "\${XDG_BIN_HOME}" ];
      TZ = "America/Sao_Paulo";
    };
    pathsToLink = [
      "/libexec"
      "/etc"
    ];
  };

  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs outputs pkgs; };

  # Network
  networking = {
    networkmanager.enable = true;
    firewall = rec {
      enable = true;
      allowedTCPPorts = [
        80
        443
      ];
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };

  };

  # Sound
  services.pulseaudio.enable = false;

  # Security
  security.rtkit.enable = true;
  security.polkit.enable = true;

  # Language
  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = lib.mkDefault "pt_BR.utf8";
      LC_IDENTIFICATION = lib.mkDefault "pt_BR.utf8";
      LC_MEASUREMENT = lib.mkDefault "pt_BR.utf8";
      LC_MONETARY = lib.mkDefault "pt_BR.utf8";
      LC_NAME = lib.mkDefault "pt_BR.utf8";
      LC_NUMERIC = lib.mkDefault "pt_BR.utf8";
      LC_PAPER = lib.mkDefault "pt_BR.utf8";
      LC_TELEPHONE = lib.mkDefault "pt_BR.utf8";
      LC_TIME = lib.mkDefault "pt_BR.UTF-8";
    };
    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
      "pt_BR.UTF-8/UTF-8"
    ];
  };

  nix = {
    settings = {
      trusted-users = [
        "root"
        "@wheel"
        "g8"
      ];
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };
  nixpkgs.hostPlatform = "x86_64-linux";

  # Hardware
  powerManagement.cpuFreqGovernor = lib.mkForce "performance";
  time.hardwareClockInLocalTime = true;
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';

  system.stateVersion = "26.05";

}
