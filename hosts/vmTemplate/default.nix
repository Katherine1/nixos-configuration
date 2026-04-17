{ config, pkgs, inputs, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ../../modules/hardware/kvm-guest.nix
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    networking = {
        hostName = "vm";
    };

    boot = {
        loader.systemd-boot.enable = true;

        kernelPackages = pkgs.linuxPackages;
        initrd = {
            systemd.enable = true;
            verbose = "false";
        };

    };

    #virtualisation.vmVariant.virtualisation.forwardPorts = [
    #    { from = "host"; host.port = 2222; guest.port = 22; }
    #    { from = "host"; host.port = 4443; guest.port = 4443; }
    #    { from = "host"; host.port = 8081; guest.port = 8080; }
    #];
    #users.users.emily.initialPassword = "test";

    system.stateVersion = "25.11";
}
