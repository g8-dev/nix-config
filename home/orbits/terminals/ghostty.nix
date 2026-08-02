{ pkgs, lib, ... }:

{
  programs.ghostty = {
    enable = true;
    package = lib.mkDefault pkgs.ghostty;
    enableZshIntegration = true;

    settings = {
      font-family = "MonoLisa Nerd Font";
    };
  }
  // lib.optionalAttrs pkgs.stdenv.hostPlatform.isDarwin {
    package = pkgs.ghostty-bin;
  };
}
