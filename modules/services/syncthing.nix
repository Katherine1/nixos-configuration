{ config, pkgs, inputs, ... }:
{
    networking.firewall = {
        allowedTCPPorts = [
            22000
        ];

        allowedUDPPorts = [
            22000
            21027
        ];
    };

    services.syncthing = {
        enable = true;
        openDefaultPorts = true;
        user = "emily";
        group = "users";
        configDir = "/home/emily/.config/syncthing";
    };
}
