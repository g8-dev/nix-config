{ ... }: {
  services = {
    displayManager = {
      sddm = {
        wayland.enable = true;
        enable = true;
        enableHidpi = false;
        autoNumlock = true;
      };
    };
  };

}
