{ config, pkgs, inputs, ... }:
{
    services.openssh = {
        enable = true;
        openFirewall = true;
        settings = {
            PasswordAuthentication = false;
            KbdInteractiveAuthentication = false;
            PermitRootLogin = "no";
            AllowUsers = [ "emily" ];
        };
    };
}
