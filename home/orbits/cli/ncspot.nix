{ ... }: {
  programs.ncspot = {
    enable = false;
    settings = {
      use_nerdfont = true;
      notifications = true;
    };
  };
}
