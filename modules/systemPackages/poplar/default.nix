{ config, pkgs, inputs, ... }:
{
    imports = [
        ../default.nix
    ];

    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
        displaycal

        #Multimedia
        mpv
        vlc
    ];
}
