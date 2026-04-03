{ config, pkgs, inputs, ... }:
{
    imports = [];

    hardware = {
        graphics = {
            enable = true;
            enable32Bit = true;
        };

        nvidia = {
            open = true;
            modesetting.enable = true;
            nvidiaSettings = true;
            powerManagement.enable = true;

            package = config.boot.kernelPackages.nvidiaPackages.latest;
            #package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
      #  let
      #    base = config.boot.kernelPackages.nvidiaPackages.latest;
      #    cachyos-nvidia-patch = pkgs.fetchpatch {
      #      url="https://raw.githubusercontent.com/CachyOS/CachyOS-PKGBUILDS/master/nvidia/nvidia-utils/kernel-6.19.patch";
      #      sha256="sha256-YuJjSUXE6jYSuZySYGnWSNG5sfVei7vvxDcHx3K+IN4=";
      #    };

      #    driverAttr = if config.hardware.nvidia.open then "open" else "bin";
      #  in
      #  base
      #  // {
      #      ${driverAttr} = base.${driverAttr}.overrideAttrs (oldAttrs: {
      #        patches = (oldAttrs.patches or [ ]) ++ [ cachyos-nvidia-patch ];
      #      });
      #    };
        };
    };

    nix.settings = {
        substituters = [
            "https://cache.nixos-cuda.org"
        ];
        trusted-public-keys = [
            "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
        ];
    };

    services.xserver = {
        enable = true;
        videoDrivers = [ 
            "nvidia"
        ];
    };
}
