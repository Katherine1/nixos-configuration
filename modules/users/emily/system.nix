{ config, pkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        ghostty
        q4wine
        bottles
        vorta
    ];
}
