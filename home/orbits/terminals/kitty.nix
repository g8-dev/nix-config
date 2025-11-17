{ ... }: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      initial_window_width = 640;
      initial_window_height = 400;
      disable_ligatures = "never";
      window_padding_width = "4 3 2";

    };
  };
}
