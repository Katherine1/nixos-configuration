{ config, pkgs, inputs, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ../../modules/hardware/poplar_filesystem.nix
        ../../modules/hardware/framework_16.nix
        ../../modules/hardware/bluetooth.nix
        ../../modules/hardware/asi-cameras.nix
        ../../modules/hardware/epson-et2750.nix
        ../../modules/hardware/epson-perfection-v600-photo.nix
        ../../modules/boot/graphical.nix
        ../../modules/locale.nix
        ../../modules/networking
        ../../modules/desktopEnvironment/kde-plasma.nix
        ../../modules/services/poplar
        ../../modules/user/poplar
        ../../modules/systemPackages/poplar
    ];

    networking.hostName = "poplar";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.loader.limine.secureBoot.enable = true;

    # Use latest kernel.
    #kernelPackages = pkgs.linuxPackages_6_19;
    kernelPackages = pkgs.linuxPackages_latest;
    initrd = {
        systemd.enable = true;
        verbose = "false";
    };

    hardware.bluetooth.settings.General.Enable = "Source,Sink,Media,Socket";

    system.stateVersion = "25.11"; #Do not change
}
