{ config, pkgs, inputs, ... }:
{
    imports = [
        inputs.nixos-hardware.nixosModules.framework-16-amd-ai-300-series-nvidia
        inputs.ucodenix.nixosModules.default
        ../graphics/nvidia.nix
        ../services/switcheroo.nix
    ];

    boot.kernelParams = [
        "amdgpu.abmlevel=0"
        #"microcode.amd_sha_check=off"
    ];

    environment.systemPackages = with pkgs; [
        framework-tool
    ];
    
    hardware.nvidia.prime = {
        offload ={
            enable = true;
            enableOffloadCmd = true;
        };
    };

    services = {
        ucodenix.enable = true;

        # NixOS Hardware wants ppd or tlp enabled by default. Override to tuned
        power-profiles-daemon.enable = false;
        tlp.enable = false;
        tuned.enable = true;
    };
}
