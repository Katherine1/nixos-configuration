{ config, pkgs, inputs, ... }:
{
    services = {
        open-webui = {
            enable = false;
            host = "127.0.0.1";
            port = 8080;
            openFirewall = true;
        };
        
        tabby = {
            enable = false;
            host = "127.0.0.1";
            port = 11029;
            acceleration = "cuda";
            usageCollection = false;
        };
    };
    
    environment.systemPackages = with pkgs; [
        ollama-cuda
        #ollama-rocm
    ];
}
