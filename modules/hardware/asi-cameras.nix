{ config, pkgs, inputs, ... }:
{
    services.udev.extraRules = let
        bash = pkgs.bash;
        coreutils = pkgs.coreutils;
    in ''
        ACTION=="add", ATTR{idVendor}=="03c3", RUN+="${bash.outPath}/bin/bash -c '${coreutils.outPath}/bin/echo 200 >/sys/module/usbcore/parameters/usbfs_memory_mb'"
        # All ASI Cameras and filter wheels
        SUBSYSTEMS=="usb", ATTR{idVendor}=="03c3", MODE="0666"
    '';
}
