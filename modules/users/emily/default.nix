{ config, pkgs, inputs, ... }:
{
    programs.zsh.enable = true;
    users.users.emily = {
        isNormalUser = true;
        shell = pkgs.zsh;
        description = "Emily Marriott";
        extraGroups = [ "networkmanager" "docker" "podman" "wheel" "tss" "scanner" "lp" ];
    };
}
