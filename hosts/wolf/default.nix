{ config, pkgs, inputs, ... }:
{
    imports = [
        ./hardware-configuration.nix
        #nixos-hardware.nixosModules.framework-12th-gen-intel
        ../../modules/hardware/kvm-guest.nix
        ../../modules/boot
        ../../modules/locale.nix

        ./services.nix
        ./systemPackages.nix
        ./users
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;

    networking = {
        hostName = "wolf";

        enableIPv6 = true;
        #interfaces.eth0 = {
        #    address = "2603:6000:9305:4bc4::2";
        #    prefixLength = 64;
        #};
    };

    boot = {
        loader.limine.secureBoot.enable = false;

        kernelPackages = pkgs.linuxPackages;
        initrd = {
            systemd.enable = true;
            verbose = "false";
        };

    };

    services = {
        power-profiles-daemon.enable = false;
        tlp.enable = false;
        tuned = {
            enable = true;
            ppdSettings = {
                profiles = {
                    power-saver = "server-powersave";
                    balanced = "throughput-performance";
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
        "/mnt/Containers" = {
            device = "smb.elm.rocks:/homes/wolf";
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
        size = 1024*32;
    }];

    system.stateVersion = "25.11";
}
