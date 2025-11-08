{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableZshIntegration = true;
    #   installVimSyntax = true;
    installBatSyntax = true;
  };
}
