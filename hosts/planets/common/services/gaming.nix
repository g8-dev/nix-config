{ pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    (lutris.override {
      extraLibraries = pkgs:
        [
          # List library dependencies here
        ];
    })
    pokemmo-installer
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "steam" "steam-original" "steam-run" ];

}
