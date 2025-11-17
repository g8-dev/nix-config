{ config, ... }:
let waylandArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";

in {
  imports = [
    ./users/g8.nix
    ./modules/features/cli
    ./modules/features/neovim
    ./modules/features/dev
    ./modules/features/programs/vscode.nix
  ];

  nixpkgs.config = { chromium.commandLineArgs = waylandArgs; };
  targets.genericLinux.enable = true;
  home.file = {
    ".vscode-server/server-env-setup" = {
      enable = true;
      source = ./server-env-setup;
    };
  };
  programs.zsh.shellAliases = {
    adb = "/mnt/c/Users/gui8/Local\\ Settings/Android/Sdk/platform-tools/adb";
  };

  programs.zsh.localVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    WGPU_BACKEND = "gl";
    BROWSER = "";
  };

}
