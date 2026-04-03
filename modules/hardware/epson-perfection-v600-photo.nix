{ config, pkgs, inputs, ... }:
{
    hardware.sane = {
        enable = true;
        disabledDefaultBackends = [ "escl" ];
        extraBackends = with pkgs; [
            (pkgs.epsonscan2.override {
                withGui = true;
                withNonFreePlugins = true;
            })
            epkowa
            sane-airscan
        ];
    };
    services = {
        #ipp-usb.enable = true;
        udev.packages = with pkgs; [ sane-airscan ];
    };
    environment.systemPackages = with pkgs; [
        kdePackages.skanlite
        (epsonscan2.override {
            withGui = true;
            withNonFreePlugins = true;
        })
        (xsane.override {
            gimpSupport = true;
        })
    ];
}
