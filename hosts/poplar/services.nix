{ config, pkgs, inputs, ... }:
{
    imports = [
        ../../modules/services/ai.nix
        ../../modules/services/audio.nix
        ../../modules/services/flatpak.nix
        ../../modules/services/fstrim.nix
        ../../modules/services/printing.nix
        ../../modules/services/syncthing.nix
        ../../modules/services/virtualization.nix
        ../../modules/services/waydroid.nix
    ];
}
