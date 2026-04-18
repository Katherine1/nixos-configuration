{ config, pkgs, inputs, ... }:
{
    networking.firewall.allowedTCPPorts = [
        80
        443
        2283
        4533
        5001
        8096
        8123
        11378
        55321
    ];

    services.caddy = {
        enable = true;
        #openFirewall = true;

        globalConfig = ''
            admin off
        '';

        virtualHosts = {
            "audiobookshelf.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.2:13378
            '';

            "bark.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.7
            '';

            "dockge.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.2:5001
            '';

            "freshrss.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.2:55321
            '';

            "homeassistant.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.3:8123
            '';

            "immich.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.2:2283
            '';

            "navidrome.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.2:4533
            '';

            "jelly.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.2:8096
            '';

            "syncthing.elm.rocks".extraConfig = ''
                tls internal
                encode gzip zstd
                reverse_proxy 192.168.50.2:8384
            '';
        };
    };
}
