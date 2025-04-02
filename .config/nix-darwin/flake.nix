{
  description = "diegofigs' system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew }:
  let
    darwin = nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "diegofigs";
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.diegofigs = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }

        ];
        specialArgs = { inherit inputs; };
      };
  in
    {
      darwinConfigurations.default = darwin;
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Diegos-MacBook-Pro
      darwinConfigurations."Diegos-MacBook-Pro" = darwin;
      # $ darwin-rebuild build --flake .#Diegos-Mac-mini
      darwinConfigurations."Diegos-Mac-mini" = darwin;
    };
}
