{ config, pkgs, inputs, ... }:
{
    networking.firewall.allowedTCPPorts = [
        22
    ];

    services.openssh = {
        enable = true;
        settings = {
            PasswordAuthentication = true;
            KbdInteractiveAuthentication = false;
            PermitRootLogin = "no";
            AllowUsers = [ "emily" ];
        };
    };
}
