{ config, pkgs, cudapkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        kstars
        siril
        pixinsight
        inputs.astro-catalogue-viewer.packages."${pkgs.stdenv.hostPlatform.system}".default
        inputs.firecapture.packages."${pkgs.stdenv.hostPlatform.system}".default
    ];
}
