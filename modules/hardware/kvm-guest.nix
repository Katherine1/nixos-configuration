{ config, pkgs, inputs, ... }:
{
    boot = {
        initrd.availableKernelModules = [
            "virtio_pci"
            "virtio_scsi"
            "virtio_blk"
        ];

        kernelModules = [
            "kvm-guest"
        ];
    };

    services.qemuGuest = {
        enable = true;
        agent.enable = true;
    }
}
