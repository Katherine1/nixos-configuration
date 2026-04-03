{ config, pkgs, inputs, ... }:
{
    imports = [];
    
    boot = {
        loader = {
            #systemd-boot.enable = true;
            limine = {
                enable = true;
                secureBoot.enable = true;
            };
            efi = {
                canTouchEfiVariables = true;
                efiSysMountPoint = "/boot/efi";
            };
        };

        plymouth = {
            enable = true;
            #theme = "BGRT";
        };

        # Use latest kernel.
        #kernelPackages = pkgs.linuxPackages_6_19;
        kernelPackages = pkgs.linuxPackages_latest;
        initrd = {
            systemd.enable = true;
            verbose = "false";
        };

        consoleLogLevel = 3;
        kernelParams = [
            "quiet"
            "udev.log_level=3"
            "systemd.show_status=auto"
        ];

    };

    security.tpm2 = {
        enable = true;
        pkcs11.enable = true;
        tctiEnvironment.enable = true;
    };

    environment.systemPackages = with pkgs; [
        sbctl
    ];
}
