{config, pkgs, inputs, ... }:
{
    virtualisation = {
        containers.enable = true;
        docker = {
            enable = true;
            enableOnBoot = true;
            autoPrune.enable = true;


            extraPackages = with pkgs; [
                docker-compose
            ];
        };
    };
}
