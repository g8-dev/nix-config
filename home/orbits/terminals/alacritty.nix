{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      font = {
        normal = {
          family = "MonoLisa";
          style = "Regular";
        };
        italic = {
          family = "MonoLisa";
          style = "Italic";
        };
        bold = {
          family = "MonoLisa";
          style = "Bold";
        };
        bold_italic = {
          family = "MonoLisa";
          style = "Bold Italic";
        };

      };
    };
  };

}
