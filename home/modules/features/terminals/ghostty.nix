{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableZshIntegration = true;
    #   installVimSyntax = true;
    installBatSyntax = true;
    settings = { font-family = "MonoLisa Nerd Font"; };
  };
}
