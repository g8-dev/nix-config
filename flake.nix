{
  description = "g8-space nix config";

  inputs = {

    # Main Flakes
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Others Flakes
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";
    nixgl.url = "github:nix-community/nixGL";
    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Third party programs, packaged with nix
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      nixgl,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      domain = "g8-space.com.br";
      forEachSystem = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
    in
    {
      nixosModules = import ./modules/nixos;
      homeModules = import ./modules/home-manager;
      overlays = import ./overlays { inherit inputs outputs; };
      packages = forEachPkgs (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });

      # Sun -----------------------------------------------------------------

      nixosConfigurations.sun = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs domain; };
        modules = [
          ./hosts/planets/00-sun
          inputs.sops-nix.nixosModules.sops
          inputs.stylix.nixosModules.stylix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              home-manager.users.g8 = ./home/missions/00-parker;
              home-manager.extraSpecialArgs = { inherit inputs outputs; };
              home-manager.sharedModules = [
                inputs.sops-nix.homeModules.sops
                inputs.nixvim.homeModules.nixvim
              ];
            };
          }
        ];
      };

      # Mercury -------------------------------------------------------------

      # Venus ---------------------------------------------------------------

      # Earth ---------------------------------------------------------------

      # Mars ----------------------------------------------------------------

      # Jupiter -------------------------------------------------------------

      nixosConfigurations.jupiter = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/planets/05-jupiter
          inputs.sops-nix.nixosModules.sops
          inputs.nixos-wsl.nixosModules.wsl
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.g8 = ./home/missions/05-juno;
              extraSpecialArgs = { inherit inputs outputs; };
              sharedModules = [
                inputs.sops-nix.homeModules.sops
                inputs.nixvim.homeModules.nixvim
                inputs.stylix.homeModules.stylix
              ];
              useUserPackages = true;
            };
          }
        ];
      };

      # Saturn --------------------------------------------------------------

      darwinConfigurations."saturn" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/planets/06-saturn
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              users.administrador.imports = [
                ./home/missions/06-cassini
              ];
              backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs outputs; };
            sharedModules = [
              inputs.stylix.homeModules.stylix
              inputs.nixvim.homeModules.nixvim
              inputs.sops-nix.homeModules.sops
            ];
          };
          }
        ];
      };

      darwinPackages = self.darwinConfigurations."cassini".pkgs;
    };

    # Uranus --------------------------------------------------------------

    # Neptune -------------------------------------------------------------
}
