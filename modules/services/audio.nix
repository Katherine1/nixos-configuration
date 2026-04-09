{ config, pkgs, inputs, ... }:
{
    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa = {
            enable = true;
            support32Bit = true;
        };
        pulse.enable = true;
        wireplumber.enable = true;
    };

    environment.systemPackages = with pkgs; [
        qpwgraph
        pavucontrol
        pulseaudio
    ];
}
