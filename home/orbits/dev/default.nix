{ pkgs, ... }:

{

  programs = {
    go.enable = true;
    java.enable = true;
    pyenv.enable = true;
    #poetry.enable = true;
    rbenv.enable = true;
  };

  # Programming languages and dependencies packages
  home.packages = with pkgs; [
    bun
    nodejs_22
    pnpm_10
    #nest-cli
    maven
    nixfmt
  ];
}
