{ ... }: {
  imports = [
    ../../browsers/firefox.nix
    ../../browsers/chromium.nix
    ../../cli
    ../../programs
    ../../services
    ../../terminals/ghostty.nix
    ../../neovim
  ];

}
