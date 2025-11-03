{
  description = "My Awesome | gui8 | Nixos Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-legacy.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-wsl.url = "github:nix-community/NixOS-WSL";
    nix-wsl.inputs.nixpkgs.follows = "nixpkgs";
    nixgl.url = "github:nix-community/nixGL";
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Others flakes
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    nixvim-legacy.url = "github:nix-community/nixvim/nixos-24.05";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixpkgs-legacy, nix-darwin
    , home-manager, nix-on-droid, nixgl, ... }@inputs:
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
      homeManagerModules = import ./modules/home-manager;
      overlays = import ./overlays { inherit inputs outputs; };
      packages = forEachPkgs (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });

      nixosConfigurations.sun = nixpkgs-unstable.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.users.g8 = ./home/sun.nix;
            home-manager.extraSpecialArgs = { inherit inputs outputs; };
            home-manager.sharedModules = [
              inputs.sops-nix.homeManagerModules.sops
              inputs.nixvim.homeManagerModules.nixvim
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
          inputs.sops-nix.homeManagerModules.sops
          inputs.nixvim.homeManagerModules.nixvim

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
            inputs.sops-nix.homeManagerModules.sops
            inputs.stylix.homeModules.stylix
            inputs.nixvim.homeManagerModules.nixvim
            ./home/uranus.nix
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
            inputs.sops-nix.homeManagerModules.sops
            inputs.nixvim.homeManagerModules.nixvim
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
              inputs.sops-nix.homeManagerModules.sops
              inputs.nixvim.homeManagerModules.nixvim
              inputs.stylix.homeModules.stylix

            ];
          }

          inputs.sops-nix.nixosModules.sops
          inputs.nix-wsl.nixosModules.wsl
          ./hosts/vaporeon
        ];
      };

      darwinConfigurations."saturn" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/saturn
          home-manager.darwinModules.home-manager

          {
            home-manager = {
              extraSpecialArgs = { inherit inputs outputs; };
              sharedModules = [
                inputs.stylix.homeModules.stylix
                inputs.nixvim.homeManagerModules.nixvim
                inputs.sops-nix.homeManagerModules.sops

              ];
              useUserPackages = true;
              users.administrador.imports = [
                ./home/saturn.nix

              ];
              backupFileExtension = "backup";
            };
          }

        ];
      };

      darwinPackages = self.darwinConfigurations."saturn".pkgs;

      nixOnDroidConfigurations.default =
        nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs-legacy { system = "aarch64-linux"; };
          modules = [
            ./hosts/umbreon

            {

              home-manager = {
                extraSpecialArgs = { inherit inputs outputs; };
                sharedModules = [
                  inputs.nixvim-legacy.homeManagerModules.nixvim
                  inputs.sops-nix.homeManagerModules.sops

                ];
                useUserPackages = true;
                backupFileExtension = "backup";
                config = ./home/umbreon.nix;
              };
            }
          ];

        };
    };
}
