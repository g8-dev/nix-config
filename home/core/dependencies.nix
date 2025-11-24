{ pkgs, lib, ... }: {
  home.packages = with pkgs;
    lib.mkIf (pkgs.stdenv.hostPlatform.isLinux) [
      appimage-run
      ventoy
      ffmpeg
      pciutils
      mesa-demos
      pulseaudio
      #unrar
      unzip
      chafa
      lshw
      imagemagick
      ffmpegthumbnailer
      poppler-utils
      xdotool
      playerctl
      xorg.xprop
      cacert
      wget

    ];
}
