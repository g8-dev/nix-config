{ pkgs, ... }:

{
  # configuration.nix
  services.ollama = {
    enable = true;
    host = "0.0.0.0"; # expõe na rede local (para acessar de outros PCs)
    port = 11434;
    package = pkgs.ollama-cpu;

    # pré-baixa o modelo na ativação do sistema
    loadModels = [
      "deepseek-coder-v2:16b"
      "qwen2.5-coder:0.5b"
    ];

    environmentVariables = {
      OLLAMA_NUM_THREADS = "32"; # 48 threads - 4 pro sistema
      OLLAMA_MAX_LOADED_MODELS = "2";
      OLLAMA_KEEP_ALIVE = "10m";
      OLLAMA_FLASH_ATTENTION = "1"; # reduz uso de memória
    };
  };

}
