{ lib, ... }: {

  stylix.base16Scheme = lib.mkForce {
    base00 = "011627"; # Background
    base01 = "d6deeb"; # Foreground
    base02 = "01111d"; # Current Line
    base03 = "1d3b53"; # Selection
    base04 = "80a4c2"; # Cursor
    base05 = "4b6479"; # Line Number
    base06 = "c5e4fd"; # Current Line Number
    base07 = "7fdbca"; # Tags/Keywords
    base08 = "637777"; # Comment
    base09 = "ef5350"; # Red
    base0A = "22da6e"; # Green
    base0B = "addb67"; # Yellow
    base0C = "82aaff"; # Blue
    base0D = "f78c6c"; # Orange
    base0E = "c792ea"; # Magenta
    base0F = "21c7a8"; # Cyan

  };
  #base00:"#ffffff" #White

  #base00:"#575656" #Bright Black
}
