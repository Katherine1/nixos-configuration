{ config, pkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        atuin
        starship
        zellij
        lazygit
        nvtopPackages.full
        libnotify

        musikcube
    ];
}
