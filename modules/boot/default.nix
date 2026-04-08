{ config, pkgs, inputs, ... }:
{
    boot = {
        loader = {
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
            "zswap.enabled=1"
            "zswap.compressor=lz4"
            "zswap.max_pool_percent=50"
            "zswap.shrinker_enabled=1"
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
