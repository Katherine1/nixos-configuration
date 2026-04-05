{ config, pkgs, inputs, ... }:
{
    imports = [
        ./hardware-configuration.nix
        nixos-hardware.nixosModules.framework-12th-gen-intel
        ../../modules/boot
        ../../modules/networking
        ../../modules/locale.nix

        ../../modules/user/emily.nix
    ];

    networking.hostName = "wolf";
    nix.settings.experimental-features = [ "nix-command", "flakes" ];

    boot = {
        loader.limine.secureBoot.enable = false;

        kernelPackages = pkgs.linuxPackages;
        initrd = {
            systemd.enable = true;
            verbose = "false";
        };

    };
}
