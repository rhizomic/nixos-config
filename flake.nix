{
  description = "My NixOS Flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    
    # TODO: Add extra-trusted-public-keys when copy/paste works
    extra-substituters = [
      # Community cache server
      "https://nix-community.cachix.org"
      # "https://cache.iog.io"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      # "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    ];
  };

  inputs = {
    # Official NixOS package source, using nixos-unstable branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland.url = "github:hyprwm/Hyprland";
    xmonad-contrib.url = github:xmonad/xmonad-contrib;
  };

  # outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: {
  outputs = { self, nixpkgs, home-manager, xmonad-contrib, ... }@inputs: {
    nixosConfigurations = {
      "202308091237" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # specialArgs = { inherit inputs; };

        modules = [
          # hyprland.nixosModules.default
          # {programs.hyprland.enable = true;}

          ./configuration.nix

	  # make home-manager as a module of nixos so that home-manager
	  # configuration will be deployed automatically when executing
	  # `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.rhizomic = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
        ] ++ xmonad-contrib.nixosModules ++ [
          # `modernise` replaces the standard xmonad module and wrapper script
          # with those from unstable. This is currently a necessary workaround to
          # make Mod-q recompilation work.
          xmonad-contrib.modernise.x86_64-linux
        ];
      };
    };
  };
}
