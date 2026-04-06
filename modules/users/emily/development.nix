{ config, pkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        zed-editor
        cursor-cli
        code-cursor
        vscode-fhs
        dbeaver-bin
        godot
        kdiff3
    ];
}
