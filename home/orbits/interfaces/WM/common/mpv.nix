{ pkgs, config, ... }: {
  programs.mpv = {
    enable = true;
    config = {
      hwdec = "nvdec";
      vo = "gpu";
      profile = "gpu-hq";
      # gpu-context = "wayland";
      ytdl-format = "bestvideo+bestaudio";
      #  background = "#${config.colorScheme.palette.base00}";
    };
    defaultProfiles = [ "gpu-hq" ];
    scripts = [ pkgs.mpvScripts.mpris ];
  };
}
