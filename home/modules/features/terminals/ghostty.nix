{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    #   installVimSyntax = true;
    installBatSyntax = true;
  };
}
