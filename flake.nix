{
  description = "My Awesome | g8 | Nixos Configuration";

  inputs = {

    # Main Flakes
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Others Flakes
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";
    nixgl.url = "github:nix-community/nixGL";
    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";

  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, nixgl, ... }@inputs:
    let
      inherit (self) outputs;

      forEachSystem = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

    in {
      nixosModules = import ./modules/nixos;
      homeModules = import ./modules/home-manager;
      overlays = import ./overlays { inherit inputs outputs; };
      packages = forEachPkgs (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });

      nixosConfigurations.sun = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.users.g8 = ./home/sun.nix;
            home-manager.extraSpecialArgs = { inherit inputs outputs; };
            home-manager.sharedModules = [
              inputs.sops-nix.homeModules.sops
              inputs.nixvim.homeModules.nixvim
              inputs.stylix.homeModules.stylix
            ];
          }

          inputs.sops-nix.nixosModules.sops
          ./hosts/sun
        ];
      };

      homeConfigurations."g8@mars" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = { inherit inputs outputs nixgl; };
        modules = [
          inputs.stylix.homeModules.stylix
          inputs.sops-nix.homeModules.sops
          inputs.nixvim.homeModules.nixvim

          ./home/mars.nix

        ];
      };

      nixosConfigurations.mars = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.sops-nix.nixosModules.sops
          inputs.stylix.nixosModules.stylix
          ./hosts/mars
        ];
      };

      homeConfigurations."g8@uranus" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            inputs.sops-nix.homeModules.sops
            inputs.stylix.homeModules.stylix
            inputs.nixvim.homeModules.nixvim
            ./home/astros/uranus.nix
          ];
        };
      nixosConfigurations.uranus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.sops-nix.nixosModules.sops
          inputs.stylix.nixosModules.stylix
          ./hosts/uranus
        ];
      };

      homeConfigurations."g8@neptune" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            inputs.sops-nix.homeModules.sops
            inputs.nixvim.homeModules.nixvim
            inputs.stylix.homeModules.stylix
            ./home/neptune.nix
          ];
        };
      nixosConfigurations.neptune = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.stylix.nixosModules.stylix
          inputs.sops-nix.nixosModules.sops
          ./hosts/neptune
        ];
      };

      nixosConfigurations.jupiter = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.users.g8 = ./home/jupiter.nix;
            home-manager.extraSpecialArgs = { inherit inputs outputs; };
            home-manager.sharedModules = [
              inputs.sops-nix.homeModules.sops
              inputs.nixvim.homeModules.nixvim
              inputs.stylix.homeModules.stylix

            ];
          }

          inputs.sops-nix.nixosModules.sops
          inputs.nix-wsl.nixosModules.wsl
          ./hosts/vaporeon
        ];
      };

      darwinConfigurations."saturn" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/saturn
          home-manager.darwinModules.home-manager

          {
            home-manager = {
              extraSpecialArgs = { inherit inputs outputs; };
              sharedModules = [
                inputs.stylix.homeModules.stylix
                inputs.nixvim.homeModules.nixvim
                inputs.sops-nix.homeModules.sops

              ];
              useUserPackages = true;
              users.administrador.imports = [
                ./home/astros/saturn.nix

              ];
              backupFileExtension = "backup";
            };
          }

        ];
      };

      darwinPackages = self.darwinConfigurations."saturn".pkgs;

    };
}
