{ lib, ... }: {

  stylix.base16Scheme = lib.mkForce {

    # Cores Neutras (base00 a base07)
    base00 = "212435"; # Fundo Principal: Azul-escuro/Quase preto
    base01 = "2d334e"; # Fundo Secundário: Painéis, status bars
    base02 = "3e4672"; # Fundo Terciário: Guias de indentação, blocos de código
    base03 = "6f78a7"; # Comentários, texto desabilitado
    base04 = "959DC2"; # Texto Secundário
    base05 = "C7D0E6"; # Texto Principal: Off-White suave
    base06 = "F8F8F8"; # Destaque claro
    base07 = "FFFFFF"; # Contraste Máximo: Branco puro

    # Cores de Acento (base08 a base0F)
    base08 = "F15C6C"; # Vermelho: Erros, Palavras-chave importantes
    base09 = "EBCB8D"; # Laranja: Strings, números
    base0A = "FDF4C1"; # Amarelo: Tipos, classes
    base0B = "A6E3A6"; # Verde: Constantes, Booleans, Adições
    base0C = "7AEADF"; # Ciano: Funções, Nomes de variáveis
    base0D = "B8BBF2"; # Azul/Roxo Claro: Palavras-chave, Variáveis
    base0E = "CBA6F7"; # Magenta/Roxo: Objetos, Props, Regex
    base0F = "F5BDE6"; # Rosa: Destaque alternativo, tags de fechamento
  };
  #base00:"#ffffff" #White

  #base00:"#575656" #Bright Black
}
