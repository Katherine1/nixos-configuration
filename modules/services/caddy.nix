{ config, pkgs, inputs, ... }:
{
    networking.firewall.allowedTCPPorts = [
        2283
        4533
        5001
        8096
        8123
        8384
        11378
        55321
    ];

    services.caddy = {
        enable = true;
        openFirewall = true;

        globalConfig = ''
            admin off
        '';

        virtualHosts = {
            "audiobookshelf.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.11:13378
            '';

            "bark.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.7
            '';

            "dockge.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.11:5001
            '';

            "freshrss.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.11:55321
            '';

            "homeassistant.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.3:8123
            '';

            "immich.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.11:2283
            '';

            "navidrome.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.11:4533
            '';

            "jelly.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.11:8096
            '';

            "syncthing.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.11:8384
            '';
        };
    };
}
