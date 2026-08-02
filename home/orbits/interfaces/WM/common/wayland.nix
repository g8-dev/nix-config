{ pkgs, ... }: {
  imports = [ ./default.nix ./waybar.nix ];

  home.packages = with pkgs; [
    grim
    hyprpicker
    nwg-look
    slurp
    swaylock-effects
    swayidle
    swayimg
    wdisplays
    wf-recorder
    wtype
    rofi-rbw-wayland
  ];

  programs.mpv.config.gpu-context = "wayland";
  programs.zsh.sessionVariables = { KITTY_ENABLE_WAYLAND = 1; };

}
