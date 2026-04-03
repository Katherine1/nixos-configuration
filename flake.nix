{
  description = "System Flake";

  inputs = {
    nixpkgs-stable-large.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable-large.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    ucodenix.url = "github:e-tho/ucodenix";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable-large";
    };
    astro-catalogue-viewer.url = "path:./pkgs/astro-catalogue-viewer";
    firecapture.url = "path:./pkgs/firecapture";
  };

  outputs = {self, nixpkgs-stable-large, nixpkgs-unstable-large, ... }@inputs: let
    system = "x86_64-linux";

    ulpkgs = import nixpkgs-unstable-large {
        inherit system;
        config.allowUnfree = true;
        config.permittedInsecurePackages = [
            "electron-38.8.4"
        ];
    };

    ulcudapkgs = import nixpkgs-unstable-large {
        inherit system;
        config.allowUnfree = true;
        config.cudaSupport = true;
        config.cudaVersion = 13;
    };

    slpkgs = import nixpkgs-stable-large {
        inherit system;
        config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
        "poplar" = nixpkgs-unstable-large.lib.nixosSystem {
            inherit system;
            pkgs = ulpkgs;
            specialArgs = {
                inherit inputs;
                cudapkgs = ulcudapkgs;
            };
	        modules = [
                ./hardware-configuration.nix
                ./hosts/poplar.nix
	        ];
        };
    };
  };
}
