{ config, pkgs, inputs, ... }:
{
    services = {
        pihole-ftl = {
            enable = true;
            openFirewallDNS = true;
            openFirewallWebserver = true;
            settings = {
                dns = {
                    upstreams = [
                        "9.9.9.9"
                        "149.112.112.112"
                        "2620:fe::fe"
                        "2620:fe::9"
                    ];

                    hosts = [
                        "192.168.50.1 gateway.elm.rocks"
                        "192.168.50.2 milwaukee.elm.rocks"
                        "192.168.50.3 homeassistant.elm.rocks"
                        "192.168.50.7 bark.elm.rocks"
                        "192.168.50.8 smb.elm.rocks"
                        "192.168.50.9 octopi.elm.rocks"
                        "192.168.50.11 audiobookshelf.elm.rocks"
                        "192.168.50.11 jelly.elm.rocks"
                        "192.168.50.11 syncthing.elm.rocks"
                        "192.168.50.11 freshrss.elm.rocks"
                        "192.168.50.11 wolf.elm.rocks"
                        "192.168.50.11 dockge.elm.rocks"
                        "192.168.50.11 immich.elm.rocks"
                        "192.168.50.11 navidrome.elm.rocks"
                    ];

                    domainNeeded = true;
                    expandHosts = true;
                    dnssec = true;
                    listeningMode = "ALL";
                    domain.name = "elm.rocks";

                    rateLimit = {
                        count = 0;
                        interval = 0;
                    };
                };
            };

            lists = [
                {
                    url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
                    type = "block";
                    enabled = false;
                    description = "Migrated from /etc/pihole/adlists.list";
                }
                {
                    url = "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/multi.txt";
                    type = "block";
                    enabled = false;
                    description = "Multi Normal: https://github.com/hagezi/dns-blocklists";
                }
            ];
        };

        pihole-web = {
            enable = true;
            ports = [
                "8080o"
                "4443os"
                #"[::]:8080o"
                #"[::]:4443"
            ];
        };
    };
}
