{ config, pkgs, inputs, ... }:
{
    imports = [
        ../graphics/nvidia.nix
        ../services/switcheroo.nix
    ];

    hardware.nvidia.prime = {
        offload ={
            enable = true;
            enableOffloadCmd = true;
        };
    };
}
