{ config, pkgs, cudapkgs, inputs, ... }:
{
    imports = [
        ./hardware-configuration.nix
        inputs.nixos-hardware.nixosModules.framework-16-amd-ai-300-series-nvidia
        inputs.ucodenix.nixosModules.default
        ../../modules/hardware/fw16_rtx_5070.nix
        ../../modules/hardware/bluetooth.nix
        ../../modules/hardware/asi-cameras.nix
        ../../modules/hardware/epson-et2750.nix
        ../../modules/hardware/epson-perfection-v600-photo.nix

        ../../modules/boot/graphical.nix
        ../../modules/locale.nix
        ../../modules/networking

        ../../modules/desktopEnvironment/kde-plasma.nix
        ./services.nix
        ./users
        ./systemPackages.nix
    ];

    networking.hostName = "poplar";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot = {
        loader.limine = {
            enable = true;
            secureBoot.enable = true;
        };

        # Use latest kernel.
        #kernelPackages = pkgs.linuxPackages_6_19;
        kernelPackages = pkgs.linuxPackages_latest;
        kernelParams = [
            "amdgpu.abmlevel=0"
            #"microcode.amd_sha_check=off"
        ];
        initrd = {
            systemd.enable = true;
            verbose = "false";
        };
    };

    hardware = {
        bluetooth.settings.General.Enable = "Source,Sink,Media,Socket";

        nvidia.prime = {
            amdgpuBusId = "PCI:194@0:0:0";
            nvidiaBusId = "PCI:001@0:0:0";
        };
    };

    services = {
        ucodenix = {
            enable = true;
            cpuModelId = "00A70F41";
        };

        # NixOS Hardware wants ppd or tlp enabled by default. Override to tuned
        power-profiles-daemon.enable = false;
        tlp.enable = false;
        tuned = {
            enable = true;
            ppdSettings = {
                battery = {
                    power-saver = "laptop-battery-powersave";
                    balanced = "balanced-battery";
                    performance = "balanced";
                };
                profiles = {
                    power-saver = "laptop-ac-powersave";
                    balanced = "balanced";
                    performance = "throughput-performance";
                };
            };
        };
    };

    environment.systemPackages = with pkgs; [
        framework-tool
    ];

    fileSystems = {
        "/".options = [ "compress=zstd" ];
        "/home".options = [ "compress=zstd" ];
        "/nix".options = [ "compress=zstd" "noatime" ];
        "/swap".options = [ "noatime" ];
        "/mnt/emily" = {
            device = "smb.elm.rocks:/homes/Emily";
            fsType = "nfs";
            options = [
                "defaults"
                "noatime"
                "nolock"
                "async"
                "vers=4.1"
                "noauto"
                "x-systemd.automount"
                "x-systemd.mount-timeout=10"
                "timeo=14"
                "x-sytemd.idle-timeout=1min"
                "_netdev"
            ];
        };
        "/mnt/Downloads" = {
            device = "smb.elm.rocks:/Download";
            fsType = "nfs";
            options = [
                "defaults"
                "noatime"
                "nolock"
                "async"
                "vers=4.1"
                "noauto"
                "x-systemd.automount"
                "x-systemd.mount-timeout=10"
                "timeo=14"
                "x-sytemd.idle-timeout=1min"
                "_netdev"
            ];
        };
        "/mnt/Multimedia" = {
            device = "smb.elm.rocks:/Multimedia";
            fsType = "nfs";
            options = [
                "defaults"
                "noatime"
                "nolock"
                "async"
                "vers=4.1"
                "noauto"
                "x-systemd.automount"
                "x-systemd.mount-timeout=10"
                "timeo=14"
                "x-sytemd.idle-timeout=1min"
                "_netdev"
            ];
        };
    };

    swapDevices = [{
        device = "/swap/swapfile";
        size = 1024*96;
    }];

    system.stateVersion = "25.11"; #Do not change
}
