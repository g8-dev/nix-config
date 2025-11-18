# HOSTS STYLIX

{ pkgs, ... }:
let
  cursorName = "Simp1e-Dark";
  cursorPkg = pkgs.simp1e-cursors;
  base16SchemeDefault =
    "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";

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
      terminal = 1.0;
      desktop = 1.0;
    };
    override = { };
    targets = {
      grub.enable = false;
      chromium.enable = false;
    };
  };

}
