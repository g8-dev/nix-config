{ pkgs, ... }: {

  imports = [ ./vscode.nix ];
  programs = {
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-shaderfilter
        wlrobs
      ];
    };
  };
  home.packages = with pkgs.unstable; [

    # programs
    discord
    evolution
    flameshot
    fontpreview
    gimp
    onlyoffice-desktopeditors
    pavucontrol
    spotify

  ];

}
