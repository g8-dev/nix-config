{ pkgs, ... }: {
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      return {
        font = wezterm.font("MonoLisa"),
        font_size = 13.0,
      }
    '';
  };

}
