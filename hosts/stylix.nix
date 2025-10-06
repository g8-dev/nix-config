{ pkgs, outputs, ... }:
let
  cursorName = "phinger-cursors-dark";
  cursorPkg = pkgs.unstable.phinger-cursors;
  base16SchemeDefault = "${pkgs.base16-schemes}/share/themes/ayu-mirage.yaml";

in {

  stylix = {
    enable = true;
    image = ../home/modules/common/extras/eevee.png;
    imageScalingMode = "center";
    autoEnable = true;
    polarity = "dark";
    base16Scheme = base16SchemeDefault;
    cursor = {
      name = cursorName;
      package = cursorPkg;
      size = 32;
    };
    fonts = {
      monospace = {
        name = "JetBrainsMonoNL Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
    };
    opacity = {
      applications = 1.0;
      terminal = 0.95;
      desktop = 1.0;
    };
    override = { };
    targets = { chromium.enable = true; };
  };

}
