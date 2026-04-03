{ config, pkgs, inputs, ... }:

{
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
}
