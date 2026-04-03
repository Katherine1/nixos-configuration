{ config, pkgs, inputs, ... }:
{
    imports = [
        ../emily.nix
        ../../systemPackages/gaming.nix
    ];

    users.users.emily = {
        packages = with pkgs; [
            #3D Printing
            prusa-slicer
            orca-slicer
            cura-appimage

            #Astro
            kstars
            siril
            pixinsight
            inputs.astro-catalogue-viewer.packages."${system}".default
            inputs.firecapture.packages."${system}".default

            #Books
            calibre
            libation
            hakuneko

            #Chat
            element-desktop
            discord
            stoat-desktop
            signal-desktop
            zoom-us

            #Development
            zed-editor
            cursor-cli
            code-cursor
            vscode-fhs
            dbeaver-bin
            filezilla
            godot
            kdiff3

            #Education
            anki-bin

            #Games
            airshipper
            augustus
            daggerfall-unity
            openmw
            xivlauncher

            #Graphics
            darktable
            rawtherapee
            (gimp-with-plugins.override {
                plugins = [ gimpPlugins.gmic ];
            })
            krita
            openscad-unstable
            blender
            freecad

            #Internet
            google-chrome
            librewolf
            vivaldi
            vivaldi-ffmpeg-codecs
            keepassxc
            kiwix
            localsend
            transmission_4-qt
            proton-vpn
            teams-for-linux
            inputs.zen-browser.packages."${system}".default

            #Multimedia
            easyeffects
            handbrake
            losslesscut-bin
            picard

            #Office
            obsidian
            libreoffice-qt-fresh
            typst
            
            #System
            ghostty
            q4wine
            bottles
            vorta
        ];
    };
}
