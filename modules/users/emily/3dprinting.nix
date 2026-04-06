{ config, pkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        prusa-slicer
        orca-slicer
        cura-appimage
    ];
}
