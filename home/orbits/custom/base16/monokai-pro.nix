{ lib, pkgs, ... }: {

  stylix.base16Scheme =
    lib.mkForce "${pkgs.base16-schemes}/share/themes/monokai.yaml";
  stylix.override = {
    base00 = "2d2a2e"; # background
    base01 = "383438"; # lighter background
    base02 = "4f4a4f"; # selection
    base03 = "686366"; # comments
    base04 = "e1e1e3"; # dark foreground
    base05 = "f8f8f2"; # default foreground
    base06 = "f9f9f5"; # light foreground
    base07 = "ffffff"; # white
    base08 = "ff6188"; # red / variables
    base09 = "fc9867"; # orange / constants
    base0A = "ffd866"; # yellow / classes
    base0B = "a9dc76"; # green / strings
    base0C = "78dce8"; # cyan / functions
    base0D = "ab9df2"; # blue / keywords
    base0E = "f975e6"; # purple / tags
    base0F = "f8f8f0"; # extra};
  };
}
