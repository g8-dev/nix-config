{ pkgs, ... }:

{
  services = {
    xserver.enable = true;
    desktopManager.gnome = { enable = true; };
  };

  services.udev.packages = with pkgs; [ gnome-settings-daemon ];
  services.gnome.gnome-browser-connector.enable = true;
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs;
    [
      contrast
      gnome-tweaks
      gtg
      foliate
      gnome-feeds
      marker
      pdfslicer
      gnome-themes-extra
      gnome-tweaks
      gnome-boxes
      gnome-music
      totem
      geary
    ] ++ (with pkgs.gnomeExtensions; [
      appindicator
      burn-my-windows
      color-picker
      desktop-cube
      docker
      dim-completed-calendar-events
      force-quit
      gnome-40-ui-improvements
      mpris-label
      order-gnome-shell-extensions
      overview-background
      tactile
      wayland-or-x11
      weather-oclock
    ]);

  # Remove default gnome packages
  environment.gnome.excludePackages =
    (with pkgs; [ atomix hitori iagno tali gnome-music ]);
}

