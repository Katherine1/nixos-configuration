{ config, pkgs, inputs, ... }:
{
    imports = [ 
        ../ai.nix
        ../audio.nix
        ../flatpak.nix
        ../printing.nix
        ../syncthing.nix
        ../virtualization.nix
        ../waydroid.nix
    ];
}
