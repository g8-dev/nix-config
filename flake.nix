{
  description = "My Awesome | g8 | Nixos Configuration - Eeveelutions Edition";

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

      # ------------------------------------------------------------- #
      # EEVEELUTIONS HOSTS
      # ------------------------------------------------------------- #

      # 1. EEVEE (Antigo: sun)
      nixosConfigurations.eevee = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs domain; };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.users.g8 = ./home/astros/eevee.nix;
            home-manager.extraSpecialArgs = { inherit inputs outputs; };
            home-manager.sharedModules = [
              inputs.sops-nix.homeModules.sops
              inputs.nixvim.homeModules.nixvim
            ];
          }
          inputs.sops-nix.nixosModules.sops
          inputs.stylix.nixosModules.stylix
          ./hosts/eevee
        ];
      };

      # 2. FLAREON (Antigo: mercury)
      homeConfigurations."g8@flareon" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = { inherit inputs outputs nixgl; };
        modules = [
          inputs.stylix.homeModules.stylix
          inputs.sops-nix.homeModules.sops
          inputs.nixvim.homeModules.nixvim
          ./home/astros/flareon.nix
        ];
      };

      nixosConfigurations.flareon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.sops-nix.nixosModules.sops
          inputs.stylix.nixosModules.stylix
          ./hosts/flareon
        ];
      };

      # 3. JOLTEON (Antigo: earth)
      homeConfigurations."g8@jolteon" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          inputs.sops-nix.homeModules.sops
          inputs.stylix.homeModules.stylix
          inputs.nixvim.homeModules.nixvim
          ./home/pokes/jolteon.nix
        ];
      };

      nixosConfigurations.jolteon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.sops-nix.nixosModules.sops
          inputs.stylix.nixosModules.stylix
          ./hosts/jolteon
        ];
      };

      # 4. VAPOREON (Antigo: jupiter - WSL)
      homeConfigurations."g8@vaporeon" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = { inherit inputs outputs nixgl; };
        modules = [
          inputs.stylix.homeModules.stylix
          inputs.sops-nix.homeModules.sops
          inputs.nixvim.homeModules.nixvim
          ./home/astros/vaporeon.nix
        ];
      };

      nixosConfigurations.vaporeon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.sops-nix.nixosModules.sops
          inputs.nixos-wsl.nixosModules.wsl
          ./hosts/vaporeon
        ];
      };

      # 5. SYLVEON (Antigo: saturn - macOS / nix-darwin)
      darwinConfigurations."sylveon" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/sylveon
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
                ./home/pokes/sylveon.nix
              ];
              backupFileExtension = "backup";
            };
          }
        ];
      };

      darwinPackages = self.darwinConfigurations."sylveon".pkgs;

      # 6. ESPEON (Antigo: uranus)
      homeConfigurations."g8@espeon" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          inputs.sops-nix.homeModules.sops
          inputs.stylix.homeModules.stylix
          inputs.nixvim.homeModules.nixvim
          ./home/astros/espeon.nix
        ];
      };

      nixosConfigurations.espeon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.sops-nix.nixosModules.sops
          inputs.stylix.nixosModules.stylix
          ./hosts/espeon
        ];
      };

      # 7. GLACEON (Antigo: neptune)
      homeConfigurations."g8@glaceon" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          inputs.sops-nix.homeModules.sops
          inputs.nixvim.homeModules.nixvim
          inputs.stylix.homeModules.stylix
          ./home/astros/glaceon.nix
        ];
      };

      nixosConfigurations.glaceon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.stylix.nixosModules.stylix
          inputs.sops-nix.nixosModules.sops
          ./hosts/glaceon
        ];
      };

      # 8. LEAFEON (Pronto para uso futuro)
      nixosConfigurations.leafeon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.stylix.nixosModules.stylix
          inputs.sops-nix.nixosModules.sops
          ./hosts/leafeon
        ];
      };

      # 9. UMBREON (Pronto para uso futuro)
      nixosConfigurations.umbreon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          inputs.stylix.nixosModules.stylix
          inputs.sops-nix.nixosModules.sops
          ./hosts/umbreon
        ];
      };

    };
}
