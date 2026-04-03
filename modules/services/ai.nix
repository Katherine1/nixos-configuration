{ config, pkgs, inputs, ... }:
{
    services.open-webui = {
        enable = false;
        host = "127.0.0.1";
        port = 8080;
    };
    
    environment.systemPackages = with pkgs; [
        ollama-cuda
        #ollama-rocm
    ];
}
