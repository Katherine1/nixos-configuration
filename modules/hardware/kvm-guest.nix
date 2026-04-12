{ config, pkgs, inputs, modulesPath, ... }:
{
    imports = [
        (modulesPath + "/profiles/qemu-guest.nix")
    ];

    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
    virtualisation.vmVariant.virtualisation = {
        memorySize = 1024*8;
        diskSize = 1024*60;
        cores = 4;
        graphics = true;
    };
}
