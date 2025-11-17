{ lib, ... }: {
  imports = [

    # Global config (required)
    ./users/g8.nix
    ./modules/features/interfaces/WM/hyprland.nix
    ./modules/features/interfaces/DE/kde.nix

  ];

  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "br";
    kb_variant = "abnt2";
  };

  stylix.image = lib.mkForce ./modules/common/custom/wallpapers/neptune.jpeg;

}
