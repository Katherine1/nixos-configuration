{ config, pkgs, inputs, ... }:
{
    imports = [
        ../../modules/services/caddy.nix
        ../../modules/services/fstrim.nix
        ../../modules/services/pihole.nix
        ../../modules/services/podman.nix
        ../../modules/services/ssh.nix
        ../../modules/services/syncthing.nix
    ];
}
