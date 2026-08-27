{
  description = "airakaaz nixos config :)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  };

  outputs =
    {
      self,
      nixpkgs,
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
          ];
        };

        specter = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs.hostname = "specter";
          modules = [
            ./configuration.nix
            ./hosts/specter/imports.nix
          ];
        };
      };
    };
}
