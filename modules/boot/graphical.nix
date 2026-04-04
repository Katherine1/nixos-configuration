{ config, pkgs, inputs, ... }:
{
    imports = [
        ./default.nix
    ];

    boot = {
        plymouth = {
            enable = true;
            #theme = "BGRT";
        };
    };
}
