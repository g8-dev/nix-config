{ ... }:

{
  # configuration.nix
  services.ollama = {
    enable = true;
    host = "0.0.0.0"; # expõe na rede local (para acessar de outros PCs)
    port = 11434;

    # pré-baixa o modelo na ativação do sistema
    loadModels = [
      "deepseek-coder-v2:16b"
    ];

    environmentVariables = {
      OLLAMA_NUM_THREADS = "48"; # 48 threads - 4 pro sistema
      OLLAMA_MAX_LOADED_MODELS = "1";
      OLLAMA_KEEP_ALIVE = "60m";
      OLLAMA_FLASH_ATTENTION = "1"; # reduz uso de memória
    };
  };
}
