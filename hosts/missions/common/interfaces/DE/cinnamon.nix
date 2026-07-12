{ pkgs, ... }: {
  services.xserver.desktopManager.cinnamon.enable = true;
  services.cinnamon.apps.enable = true;

  # environment.systemPackages = (with pkgs; [
  #   xclip
  #   mpv
  #   mpvScripts.mpris
  #   gnome.gpaste
  #   python311Packages.feedparser
  # ]);

}
