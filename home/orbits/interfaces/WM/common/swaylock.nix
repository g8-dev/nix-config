{ pkgs, outputs, config, ... }:
let
in {

  services.screen-locker = {
    enable = true;
    inactiveInterval = 10;
    lockCmd =
      "swaylock --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color 7aa2f7cc --ring-clear-color 32344a --ring-ver-color e0af68 --ring-wrong-color f7768e --key-hl-color 73dacaee --bs-hl-color f7768e --line-color 00000000 --line-clear 00000000 --line-ver-color 00000000 --line-wrong-color 00000000 --inside-color 00000000 --inside-clear-color 32344a --inside-ver-color 00000000 --inside-wrong-color 00000000 --separator-color 7aa2f7cc --text-color c0caf6 --text-clear-color c0caf6 --text-ver-color c0caf6 --text-wrong-color c0caf6 --grace 2 --fade-in 0.2";
  };

}

