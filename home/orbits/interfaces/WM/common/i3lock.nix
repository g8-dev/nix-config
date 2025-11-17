{ pkgs, outputs, config, ... }:
let
  BLANK = "#${config.colorScheme.palette.base00}00";
  BACKGROUND = "#${config.colorScheme.palette.base00}AA";
  CLEAR = "#${config.colorScheme.palette.base01}22";
  DEFAULT = "#${config.colorScheme.palette.base0B}cc";
  TEXT = "#${config.colorScheme.palette.base06}ee";
  WRONG = "#${config.colorScheme.palette.base08}bb";
  INPUT = "#${config.colorScheme.palette.base0D}ee";
  VERIFYING = "#${config.colorScheme.palette.base0A}bb";
  screen-locker = pkgs.writeShellScript "script" ''
    ${pkgs.i3lock-color}/bin/i3lock  --beep --nofork --screen 1 --blur 5 --indicator --ignore-empty-password --clock --line-uses-ring --radius=300 --ring-width=18.0 --line-color=${BLANK} --inside-color=${BACKGROUND} --ring-color=${DEFAULT} --insidever-color=${CLEAR} --ringver-color=${VERIFYING} --insidewrong-color=${CLEAR} --ringwrong-color=${WRONG} --keyhl-color=${INPUT} --bshl-color=${WRONG} --separator-color=${DEFAULT} --verif-color=${TEXT} --wrong-color=${TEXT} --modif-color=${TEXT} --date-color=${TEXT} --time-color=${TEXT} --time-str="%H:%M:%S" --date-str="Hoje é %A, dia %d/%m/%Y." --verif-text="Analyzing..." --wrong-text="Password error!" --noinput-text="None!" --lock-text="Locking screen..." --lockfailed-text="Lock failed!"  --time-align=0 --date-align=0 --time-font="Dank Mono:style=Italic" --date-font="Dank Mono:style=Italic" --verif-font="Dank Mono:style=Italic" --wrong-font="Dank Mono:style=Italic" --time-size=48 --date-size=32 --verif-size=32 --wrong-size=32 --date-pos="tx:ty+50"
  '';
in {
  services.screen-locker = {
    enable = true;
    inactiveInterval = 30;
    lockCmd = "${screen-locker}";
  };

}

