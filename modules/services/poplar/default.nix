{ config, pkgs, inputs, ... }:
{
    imports = [ 
        ../ai.nix
        ../audio.nix
        ../flatpak.nix
        ../fstrim.nix
        ../printing.nix
        ../syncthing.nix
        ../virtualization.nix
        ../waydroid.nix
    ];
}
