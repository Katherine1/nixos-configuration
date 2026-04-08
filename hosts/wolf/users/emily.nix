{ config, pkgs, inputs, ... }:
{
    imports = [
        ../../../modules/users/emily
        ../../../modules/users/emily/cli.nix
    ];
}
