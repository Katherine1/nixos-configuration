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
        ../../modules/boot
        ../../modules/locale.nix
        ../../modules/networking
        ../../modules/desktopEnvironment/kde-plasma.nix
        ../../modules/services/poplar
        ../../modules/user/poplar
        ../../modules/systemPackages/poplar
    ];

    networking.hostName = "poplar";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    hardware.bluetooth.settings.General.Enable = "Source,Sink,Media,Socket";

    system.stateVersion = "25.11"; #Do not change
}
