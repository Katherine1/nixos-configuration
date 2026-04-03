{ config, pkgs, inputs, ... }:
{
    imports = [
        inputs.nixos-hardware.nixosModules.framework-16-amd-ai-300-series-nvidia
        inputs.ucodenix.nixosModules.default
        ../graphics/nvidia.nix
    ];

    boot.kernelParams = [
        "amdgpu.abmlevel=0"
        #"microcode.amd_sha_check=off"
    ];

    environment.systemPackages = with pkgs; [
        framework-tool
        switcheroo-control
    ];
    
    hardware.nvidia.prime = {
        offload ={
            enable = true;
            enableOffloadCmd = true;
        };
        amdgpuBusId = "PCI:194@0:0:0";
        nvidiaBusId = "PCI:001@0:0:0";
    };

    services = {
        ucodenix = {
            enable = true;
            cpuModelId = "00A70F41";
        };

        # NixOS Hardware wants ppd or tlp enabled by default. Override to tuned
        power-profiles-daemon.enable = false;
        tlp.enable = false;
        tuned = {
            enable = true;
            ppdSettings = {
                battery = {
                    power-saver = "laptop-battery-powersave";
                    balanced = "balanced-battery";
                    performance = "balanced";
                };
                profiles = {
                    power-saver = "laptop-ac-powersave";
                    balanced = "balanced";
                    performance = "throughput-performance";
                };
            };
        };
    };

    systemd.services.switcheroo-control = {
        description = "Switcheroo Control Proxy service";
        before = [ "multi-user.target" "display-manager.service" "alsa-restore.service" "alsa-state.service" ];
        serviceConfig = {
            ExecStart = "${pkgs.switcheroo-control}/libexec/switcheroo-control";
        };
        wantedBy = [ "graphical.target" ];
    };
}
