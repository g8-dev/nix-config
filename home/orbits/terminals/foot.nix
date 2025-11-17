{ ... }: {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        dpi-aware = "no";
        pad = "8x0";
      };
      mouse = { hide-when-typing = "yes"; };

    };
  };
}
