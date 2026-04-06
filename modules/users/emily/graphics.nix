{ config, pkgs, inputs, ... }:
{
    users.users.emily.packages = with pkgs; [
        darktable
        rawtherapee
        (gimp-with-plugins.override {
            plugins = [ gimpPlugins.gmic ];
        })
        krita
        openscad-unstable
        blender
        freecad
    ];
}
