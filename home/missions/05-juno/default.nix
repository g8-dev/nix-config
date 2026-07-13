{ pkgs, ... }:
let
  waylandArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";

in
{
  imports = [
    ../../astronauts/g8.nix
    ../../orbits/cli
    ../../orbits/neovim
    ../../orbits/dev
  ];

  nixpkgs.config = {
    chromium.commandLineArgs = waylandArgs;
    allowUnfree = true;
  };
  targets.genericLinux.enable = true;
  #  programs.zsh.shellAliases = {
  # adb = "/mnt/c/Users/gui8/Local\\ Settings/Android/Sdk/platform-tools/adb";
  #};

  # vscode requireds
  # programs.zsh.localVariables = {
  #  ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  #  NIXOS_OZONE_WL = "1";
  #  MOZ_ENABLE_WAYLAND = "1";
  #  WGPU_BACKEND = "gl";
  #  BROWSER = "";
  #};

  stylix.image = ./wallpaper.png;

}
