{ config, pkgs, inputs, ... }:
{
    imports = [];

    networking = {
        networkmanager.enable = true;
        firewall.enable = true;

#       nameservers = [ "127.0.0.1" ];
    };

    services = {
        avahi = {
            enable = true;
            nssmdns4 = true;
        };

#        dnsmasq = {
#            enable = true;
#            settings = {
#                listen-address = [ "127.0.0.1" ];
#                bind-interfaces = true;
#                server = [
#                    "/elm.rocks/192.168.50.2"
#                ];
#            };
#        };
    };
}
