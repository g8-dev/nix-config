{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableZshIntegration = true;
    #   installVimSyntax = true;
    settings = {
      font-family = "MonoLisa Nerd Font";
      "keybind" = [
        # Faz o Command físico enviar o sinal de Control para o terminal
        "super=ctrl"

        # Faz o Control físico enviar o sinal de Command (útil se quiser usar atalhos do Ghostty com ctrl)
        "ctrl=super"
      ];
    };
  };
}
