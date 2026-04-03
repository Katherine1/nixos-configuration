{ config, pkgs, inputs, ... }:
{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "emily";
    group = "users";
    configDir = "/home/emily/.config/syncthing";
  };
}
