{ ... }: {
  imports = [
    ../../browsers/firefox.nix
    ../../browsers/chromium.nix
    ../../cli
    ../../programs
    ../../services
    ../../terminals/kitty.nix
    ../../neovim
  ];
}
