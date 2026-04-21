{ config, pkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        obsidian
        libreoffice-qt-fresh
        typst
        tinymist
    ];
}
