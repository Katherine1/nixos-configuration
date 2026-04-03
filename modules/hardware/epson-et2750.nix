{ config, pkgs, inputs, ... }:
{
    services.printing.drivers = [ pkgs.epson-escpr ];
}
