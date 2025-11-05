{ lib, ... }: {
  imports = [

    # Global config (required)
    ./users/g8.nix
    ./modules/features/interfaces/DE/gnome.nix

  ];

  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "br";
    kb_variant = "abnt2";
  };

  stylix.image = lib.mkForce ./modules/common/custom/wallpapers/uranus.jpeg;
}
