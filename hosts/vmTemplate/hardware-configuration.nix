{ config, lib, pkgs, inputs, modulesPath, ... }:
{
    #Placeholder
    imports = [
        (modulesPath + "/profiles/qemu-guest.nix")
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
