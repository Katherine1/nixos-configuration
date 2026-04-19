{ config, pkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        airshipper
        augustus
        daggerfall-unity
        openmw
        prismlauncher
        xivlauncher
    ];
}
