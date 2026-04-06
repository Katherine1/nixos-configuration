{ config, pkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        easyeffects
        handbrake
        losslesscut-bin
        picard
    ];
}
