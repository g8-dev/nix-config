{ pkgs, config, ... }: {
  programs.wpaperd = { enable = true; };

  xdg.configFile."wpaperd/wallpaper.toml" = {
    text = ''
      [default]
      path = ${config.stylix.image}
    '';
  };
}
