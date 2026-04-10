{ config, pkgs, inputs, ... }:
{
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
}
