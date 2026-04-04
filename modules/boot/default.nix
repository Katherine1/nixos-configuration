{ config, pkgs, inputs, ... }:
{
    boot = {
        loader = {
            #systemd-boot.enable = true;
            limine = {
                enable = true;
            };
            efi = {
                canTouchEfiVariables = true;
                efiSysMountPoint = "/boot/efi";
            };
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
