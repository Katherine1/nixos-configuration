{ config, pkgs, inputs, ... }:
{
    services.jellyfin = {
        enable = true;
        openFirewall = true;

        dataDir = "/mnt/Containers/Jellyfin-data/";
    };
}
