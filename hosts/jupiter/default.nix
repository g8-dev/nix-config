{ inputs, ... }:

{
  imports = [

    ../common/users/g8.nix
    #   ../common/hardware/gpu/amdgpu.nix
    #   ../stylix.nix

  ];
  wsl = {
    enable = true;
    #wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    wslConf.network.hostname = "jupiter";
    useWindowsDriver = true;

    defaultUser = "g8";
    startMenuLaunchers = true;

    # Enable integration with Docker Desktop (needs to be installed)
    docker-desktop.enable = false;
  };

  # environment = {
  #  systemPackages = [ ];
  #  sessionVariables = {
  #    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  #    NIXOS_OZONE_WL = "1";
  #    MOZ_ENABLE_WAYLAND = "1";
  #    WGPU_BACKEND = "gl";
  #    BROWSER = "org.qutebrowser.qutebrowser.desktop";
  #    WSLENV = "ANDROID_HOME/p";
  #    ANDROID_HOME = "/mnt/c/Users/gui8/Local Settings/Android/Sdk";
  #  };

  #};

}
