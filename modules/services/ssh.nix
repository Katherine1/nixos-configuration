{ config, pkgs, inputs, ... }:
{
    services.openssh = {
        enable = true;
        openFirewall = true;
        settings = {
            PasswordAuthentication = true;
            KbdInteractiveAuthentication = false;
            PermitRootLogin = "no";
            AllowUsers = [ "emily" ];
        };
    };
}
