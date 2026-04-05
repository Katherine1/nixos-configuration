{ config, pkgs, inputs, ... }:
{
    programs = {
        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = false;
            protontricks.enable = true;
        };

        gamemode.enable = true;
        gamescope.enable = true;
    };

    environment.systemPackages = with pkgs; [
        heroic
        mangohud
        mangojuice
    ];
}
