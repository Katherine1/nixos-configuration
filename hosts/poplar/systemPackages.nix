{ config, pkgs, inputs, ... }:
{
    imports = [
        ../../modules/systemPackages/cli.nix
        ../../modules/systemPackages/graphical.nix
        ../../modules/systemPackages/gaming.nix
    ];
}
