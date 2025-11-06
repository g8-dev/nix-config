{ config, inputs, pkgs, nixgl, ... }:
let wrapGL = config.lib.nixGL.wrap;
in {
  imports = [

    # Global config (required)
    ./users/g8.nix

    ./modules/features/cli
    ./modules/features/dev
    ./modules/features/neovim
    ./modules/features/terminals/ghostty.nix

  ];
  targets.genericLinux.enable = true;
  programs = {
    ghostty.package = wrapGL pkgs.ghostty;
    vscode.package = wrapGL pkgs.vscode;
  };
  home.packages = with pkgs; [ (wrapGL gimp) (wrapGL onlyoffice-bin) ];

  nixGL.packages = nixgl.packages;
  nixGL.defaultWrapper = "mesa";
  nixGL.offloadWrapper = "mesa";
  nixGL.installScripts = [ "mesa" ];
  xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
    [Service]
    Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
    Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
  '';

}
