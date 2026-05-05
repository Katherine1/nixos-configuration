{ config, pkgs, inputs, lib, ... }:
{
    services = {
        ollama = {
            enable = true;
            host = "127.0.0.1";
            port = 11434;
            openFirewall = true;
            package = pkgs.ollama-cuda;
        };

        open-webui = {
            enable = true;
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

    systemd.services = {
        ollama.wantedBy = lib.mkForce [];
        open-webui.wantedBy = lib.mkForce [];
    };

    environment.systemPackages = with pkgs; [
        aider-chat-full
    ];
}
