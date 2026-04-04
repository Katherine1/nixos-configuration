{ config, pkgs, inputs, ... }:
{
    systemd.services.switcheroo-control = {
        description = "Switcheroo Control Proxy service";
        before = [ "multi-user.target" "display-manager.service" "alsa-restore.service" "alsa-state.service" ];
        serviceConfig = {
            ExecStart = "${pkgs.switcheroo-control}/libexec/switcheroo-control";
        };
        wantedBy = [ "graphical.target" ];
    };

    environment.systemPackages = with pkgs; [
        switcheroo-control
    ];
}
