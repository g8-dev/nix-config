{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableZshIntegration = true;
    #   installVimSyntax = true;
    settings = {
      font-family = "MonoLisa Nerd Font";
   };
  };
}
