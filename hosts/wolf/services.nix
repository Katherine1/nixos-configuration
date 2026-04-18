{ config, pkgs, inputs, ... }:
{
    imports = [
        ../../modules/services/caddy.nix
        ../../modules/services/docker.nix
        ../../modules/services/fstrim.nix
        ../../modules/services/home-assistant.nix
        ../../modules/services/pihole.nix
        ../../modules/services/ssh.nix
        #../../modules/services/syncthing.nix
    ];
}
