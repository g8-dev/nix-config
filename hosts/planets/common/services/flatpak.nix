{
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.config.common.default = "*";

  # Activate
  /*  
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    flatpak install  -y
  */
}
