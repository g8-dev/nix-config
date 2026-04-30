{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    host = "0.0.0.0";
    port = 11434;
    package = pkgs.ollama-cpu;

    loadModels = [
      "deepseek-coder-v2:16b"
      "qwen2.5-coder:3b"
    ];
  };

  systemd.services.ollama = {
    serviceConfig = {
      Environment = [
        "OMP_NUM_THREADS=24"
        "OLLAMA_MAX_LOADED_MODELS=1"
        "OLLAMA_KEEP_ALIVE=-1"
        "OLLAMA_CONTEXT_LENGTH=4096"
        "OLLAMA_BATCH_SIZE=128"
      ];

      ExecStart = [
        ""
        "${pkgs.numactl}/bin/numactl --interleave=all ${pkgs.ollama}/bin/ollama serve"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    numactl
  ];
}
