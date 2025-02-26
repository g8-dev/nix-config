# This file (and the global directory) holds config that i use on all hosts
{ config, lib, inputs, outputs, pkgs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ./sops.nix ];

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

  programs = {
    dconf.enable = true;
    git.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };

      flake = "${config.users.users.guifuentes8.home}/nix-config";
    };
  };

  environment = {
    systemPackages = with pkgs; [ sops ];
    sessionVariables = {
      FLAKE = "${config.users.users.guifuentes8.home}/nix-config";
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
      PATH = [ "\${XDG_BIN_HOME}" ];
      TZ = "America/Sao_Paulo";
    };
    pathsToLink = [ "/libexec" "/etc" ];
  };

  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs outputs pkgs; };

  # Network
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];
    };
  };
  time = {
    hardwareClockInLocalTime = true;
    timeZone = lib.mkDefault "America/Sao_Paulo";
  };

  # Sound
  #  sound.enable = true;
  hardware.pulseaudio.enable = false;

  # Fonts
  fonts.packages = with pkgs;
    [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

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
    supportedLocales =
      lib.mkDefault [ "en_US.UTF-8/UTF-8" "pt_BR.UTF-8/UTF-8" ];
  };

  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    hostPlatform = "x86_64-linux";
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [ "jitsi-meet-1.0.8043" ];
    };
  };
  system = {
    stateVersion = "24.11";
    autoUpgrade = {
      enable = false;
      allowReboot = false;
      dates = "daily";
    };
  };

  # Hardware
  powerManagement.cpuFreqGovernor = lib.mkForce "performance";

  # boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  # boot.extraModprobeConfig = ''
  #   options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  # '';

}
