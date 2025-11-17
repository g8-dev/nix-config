{ outputs, pkgs, nix-colors, config, ... }:
let wallpaper = ./theme/wallpapers/wallpaper.png;
in {
  imports = [ ./common ./common/wm/xorg ./theme ];

  xsession.windowManager.bspwm = {
    enable = true;
    alwaysResetDesktops = true;
    startupPrograms = [
      "pkill -USR1 -x sxhkd"
      "sxhkd"
      "picom"
      "systemctl --user restart polybar.service"
      "feh --bg-center ${wallpaper} --image-bg '#1e1e2e'"
      "pkill dunst"
      "dunst"
      #  "xsetroot -cursor_name '${configOptions.styles.cursor.name}'"
    ];
    extraConfig = ''
      bspc monitor -d 󰇩   󰓇 󱄄      

      bspc config border_width         ${configOptions.styles.wm.borderWidth}
      bspc config window_gap           12

      bspc config split_ratio          0.50
      bspc config borderless_monocle   true
      bspc config gapless_monocle      true

      bspc config normal_border_color '#${config.colorScheme.palette.base01}'
      bspc config active_border_color '#${config.colorScheme.palette.base01}'
      bspc config focused_border_color '#${config.colorScheme.palette.base0E}'
      bspc config presel_feedback_color '#${config.colorScheme.palette.base0E}'

      bspc config focus_follows_pointer true
      bspc config pointer_follows_focus true
    '';
  };
}
