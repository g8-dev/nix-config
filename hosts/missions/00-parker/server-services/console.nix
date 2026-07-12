{ pkgs, ... }:
{
  console = {
    earlySetup = true;
    font = "Lat2-Terminus16";

    packages = with pkgs; [ terminus_font ];
  };
}
