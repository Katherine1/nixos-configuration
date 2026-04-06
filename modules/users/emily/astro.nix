{ config, pkgs, cudapkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        kstars
        siril
        pixinsight
        inputs.astro-catalogue-viewer.packages."${system}".default
        inputs.firecapture.packages."${system}".default
    ];
}
