{ ... }:
{

  # configuration.nix
  services.ollama = {
    enable = true;
    host = "0.0.0.0"; # expõe na rede local (para acessar de outros PCs)
    port = 11434;
    # pré-baixa o modelo na ativação do sistema
    loadModels = [ "qwen2.5-coder:32b-instruct-q4_K_M" ];
  };
}
