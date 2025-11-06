{ pkgs, ... }: {
  services.picom = {
    enable = true;
    package = pkgs.picom-allusive;
    extraArgs = [ ];
    backend = "glx";
    vSync = true;
    shadow = false;
    shadowOffsets = [ 1 2 ];
    shadowOpacity = 0.2;
    shadowExclude = [
      "class_g =  'Polybar'"

    ];
    opacityRules = [ ];

    settings = {

      animations = true;
      # Changes animation stiffness.
      # What stiffness basically is inferring is how much the window geometry will be stretched,
      # when opening/closing windows
      animation-stiffness = 120;
      # Change the mass of windows
      # Modifying the mass of windows makes them virtually heavier and therefore slower to animate.
      animation-window-mass = 0.5;
      # Change dampening applied during the animation
      # This setting basically does what it says. It dampens the animation of windows.
      animation-dampening = 12;
      # Toggles clamping
      # if you are using a animation setting that would make the window extend larger than it would be after,
      # the animation has played then it will cut the animation off once the window reaches its physical geometry.
      animation-clamping = false;
      # Set the open window animation.
      # Options: ("none","zoom","fly-in","slide-up","slide-down","slide-left","slide-right")
      animation-for-open-window = "zoom";
      # Set the closing window animation.
      # Options: ("none","zoom","fly-in","slide-up","slide-down","slide-left","slide-right")
      animation-for-unmap-window = "zoom";

      # corner-radius = configOptions.styles.wm.borderRadius;
      rounded-corners-exclude = [ "class_g = 'Polybar'" "class_g = 'Rofi'" ];

      # Explicitly declare the corner-radius of individual windows.
      #
      # corners-rule = [
      #   "20:class_g    = 'Polybar'",
      #   "15:class_g    = 'Dunst'",
      # ];

      # Exclude conditions for rounded corners.
      #
      # rounded-corners-exclude = [
      #   "window_type = 'dock'",
      #   "class_g = 'bar'"
      # ];

      shadow-radius = 7;
      # shadow-exclude = [
      #   "class_g = 'change-me'",
      # ]

      fading = true;

      # Opacity change between steps while fading in. (0.01 - 1.0, defaults to 0.03)
      #
      # Increasing this value will result in faster fading in of windows. 
      # Decreasing makes the fading in of windows take longer. 
      # (This does not means the animations take longer, just the fading).
      fade-in-step = 3.0e-2;

      # Opacity change between steps while fading out. (0.01 - 1.0, defaults to 0.03)
      #
      # Increasing this value will result in faster fading out AND animating out of windows. 
      # Decreasing this makes fading and animating out take longer.
      fade-out-step = 3.0e-2;

      # The time between steps in fade step, in milliseconds. (> 0, defaults to 10)
      # fade-delta = 10

      # Specify a list of conditions of windows that should not be faded.
      # fade-exclude = []

      # Do not fade on window open/close.
      # no-fading-openclose = false

      # Do not fade destroyed ARGB windows with WM frame. Workaround of bugs in Openbox, Fluxbox, etc.
      # no-fading-destroyed-argb = false

      # Blur background of windows.
      blur-background = true;
      blur-method = "dual_kawase";
      blur-radius = 4;
      blur-strength = 6;
      blur-whitelist = true;
      blur-rule = [
        "class_g = 'Polybar'"
        "class_g = 'Alacritty'"
        "class_g = 'kitty'"
        "class_g = 'org.wezfurlong.wezterm'"
        "class_g = 'Rofi'"
        "class_g = 'Dunst'"
      ];

      # Blacklist for background blurring. 
      # Only works if "blur-whitelist = false;"
      #
      # blur-exclude = [
      #   "class_g = 'Firefox'"
      # ];

      wintypes = {
        utility = {
          shadow = false;
          focus = true;
        };
        popup_menu = {
          shadow = false;
          focus = true;
        };
        dropdown_menu = { shadow = false; };
        menu = { shadow = false; };
      };

    };
  };
}
