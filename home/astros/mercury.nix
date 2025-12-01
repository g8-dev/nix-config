{ config, inputs, pkgs, nixgl, ... }:
let wrapGL = config.lib.nixGL.wrap;
in {
  imports = [

    # Global config (required)
    ../astronauts/g8.nix

    ../orbits/cli
    ../orbits/dev
    ../orbits/neovim
    #   ../orbits/terminals/ghostty.nix

  ];

  programs = {
    ghostty.package = wrapGL pkgs.ghostty;
    vscode.package = wrapGL pkgs.vscode;
  };

  targets.genericLinux = {
    enable = true;
    nixGL.packages = nixgl.packages;
    nixGL.defaultWrapper = "mesa";
    nixGL.offloadWrapper = "mesa";
    nixGL.installScripts = [ "mesa" ];
  };

  xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
    [Service]
    Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
    Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
  '';

}
