{ config, pkgs, inputs, ... }:
{
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    config.common.default = [ "kde" "*" ];
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];
  };
}
