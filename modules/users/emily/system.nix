{ config, pkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        appimage-run
        ghostty
        q4wine
        bottles
        vorta
    ];
}
