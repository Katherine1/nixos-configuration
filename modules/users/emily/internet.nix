{ config, pkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        #Browsers
        vivaldi
        vivaldi-ffmpeg-codecs
        librewolf
        inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
        kiwix

        #Security
        keepassxc

        #Bittorrent
        transmission_4-qt

        #VPN
        proton-vpn

        #File Transfer
        localsend
        filezilla
    ];
}
