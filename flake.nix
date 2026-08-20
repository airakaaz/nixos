{
  description = "airakaaz nixos config :)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:

    {
      nixosConfigurations = {
        phantom = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs.hostname = "phantom";
          modules = [
            ./configuration.nix
            ./hosts/phantom/imports.nix
            home-manager.nixosModules.home-manager
          ];
        };

        specter = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs.hostname = "specter";
          modules = [
            ./configuration.nix
            ./hosts/specter/imports.nix
            home-manager.nixosModules.home-manager
          ];
        };
      };
    };
}
