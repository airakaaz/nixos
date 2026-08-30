{
  description = "airakaaz nixos config :)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    israel-ip-blocker.url = "github:airakaaz/israel-ip-blocker";
  };

  outputs =
    { nixpkgs, israel-ip-blocker, ... }:

    {
      nixosConfigurations = {
        phantom = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            hostname = "phantom";
          };
          modules = [
            ./configuration.nix
            ./hosts/phantom/imports.nix
            israel-ip-blocker.nixosModules.default
          ];
        };

        specter = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = {
            hostname = "specter";
          };
          modules = [
            ./configuration.nix
            ./hosts/specter/imports.nix
            israel-ip-blocker.nixosModules.default
          ];
        };
      };
    };
}
