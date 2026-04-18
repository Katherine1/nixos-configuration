{ config, pkgs, ulpkgs, inputs, ... }:
{
    services = {
        home-assistant = {
            enable = false;
            openFirewall = true;

            package = ulpkgs.home-assistant;

            config = {
                homeassistant = {
                    latitude = 43.11;
                    longitude = -88.34;
                    name = "Home";
                    temperature_unit = "F";
                    time_zone = "America/Chicago";
                    unit_system = "us_customary";
                };

                server_port = 8123;
            };
            
            extraComponents = [
                "default_config"
                "met"
                "radio_browser"
                "mqtt"
                "usb"
                "zha"
            ];
        };

        mosquitto.enable = false;
    };
}
