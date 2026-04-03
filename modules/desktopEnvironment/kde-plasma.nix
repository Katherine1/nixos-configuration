{ config, pkgs, inputs, ... }:
{
    imports = [];

    services = {
        displayManager.plasma-login-manager.enable = true;

        desktopManager.plasma6 = {
            enable = true;
            enableQt5Integration = true;
        };
    };

    environment.systemPackages = with pkgs; [
        kdePackages.filelight
        kdePackages.kcalc
        kdePackages.kate
        kdePackages.partitionmanager
        kara
    ];

    programs = {
        kclock.enable = true;
        kdeconnect.enable = true;
    };
}
