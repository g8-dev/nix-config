{ ... }: {
  security.pam.services.lightdm.enableGnomeKeyring = true;
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        #        background = ./login.jpg;
        enable = true;
        greeters = {
          gtk = {
            enable = true;
            #          theme = {
            #            name = configOptions.styles.gtk.name;
            #            package = configOptions.styles.gtk.package;
            #          };
            #          iconTheme = {
            #            name = configOptions.styles.icon.name;
            #            package = configOptions.styles.icon.package;
            #          };
            #          cursorTheme = {
            #            name = configOptions.styles.cursor.name;
            #            package = configOptions.styles.cursor.package;
            #            #              size = configOptions.styles.cursor.size;
            #          };
            # clock-format = null;
            indicators = [
              "~host"
              "~spacer"
              "~clock"
              "~spacer"
              "~session"
              "~language"
              "~a11y"
              "~power"
            ];
            extraConfig = "";
          };
        };
      };
    };
  };
}
