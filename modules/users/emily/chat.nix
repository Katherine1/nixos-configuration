{ config, pkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        element-desktop
        discord
        stoat-desktop
        signal-desktop
        teams-for-linux
        zoom-us
    ];
}
