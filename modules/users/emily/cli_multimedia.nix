
{ config, pkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        musikcube
    ];
}
