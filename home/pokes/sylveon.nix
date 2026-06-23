{ pkgs, ... }:
{

  imports = [

    # ASTRONAUT
    ../astronauts/darwin.nix

    # ORBITS
    ../orbits/neovim
    ../orbits/dev
    ../orbits/cli
    ../orbits/programs/vscode.nix
    ../orbits/terminals/ghostty.nix
    ../orbits/browsers/firefox.nix

  ];
  programs.zsh.initContent = ''
    ${pkgs.krabby}/bin/krabby sylveon --no-title
  '';
}
