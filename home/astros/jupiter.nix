{ config, ... }:
let waylandArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";

in {
  imports = [
    ../astrounauts/g8.nix
    ../orbits/cli
    ../orbits/neovim
    ../orbits/dev
    ../orbits/vscode.nix
  ];

  nixpkgs.config = { chromium.commandLineArgs = waylandArgs; };
  targets.genericLinux.enable = true;
  home.file = {
    ".vscode-server/server-env-setup" = {
      enable = true;
      source = ./server-env-setup;
    };
  };
  #  programs.zsh.shellAliases = {
  # adb = "/mnt/c/Users/gui8/Local\\ Settings/Android/Sdk/platform-tools/adb";
  #};

  # programs.zsh.localVariables = {
  #  ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  #  NIXOS_OZONE_WL = "1";
  #  MOZ_ENABLE_WAYLAND = "1";
  #  WGPU_BACKEND = "gl";
  #  BROWSER = "";
  #};

}
