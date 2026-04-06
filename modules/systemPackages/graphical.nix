{ config, pkgs, inputs, ... }:
{
    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
        displaycal

        #Multimedia
        mpv
    ];
}
