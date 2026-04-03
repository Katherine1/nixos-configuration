{
    description = "FireCapture - Planteary Imaging Software";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, ... }@inputs: let
        supportedSystems = [ "x86_64-linux" ];
        forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in {
        packages = forAllSystems (system: 
        let
            pkgs = import nixpkgs {
                inherit system;
            };
            desktopItem = pkgs.makeDesktopItem {
                name = "FireCapture v2.7";
                desktopName = "FireCapture v2.7";
                comment = "FireCapture planetary capture tool";
                # This will result in // at the root of the path, but it's needed to pass validation
                icon = "/@out@/icon.png";
                exec = "/@out@/start.sh";
                path = "/@out@";
                # Terminal seems to want only specific terminal emulators. More at https://gitlab.gnome.org/GNOME/glib/-/issues/338
                #terminal = true;
                categories = [ "Utility" "Development" ];
            };
        in {
            default = pkgs.stdenv.mkDerivation rec {
                pname = "firecapture";
                version = "2.7.15";

                src= pkgs.fetchurl {
                    url = "https://github.com/riblee/ppa/raw/3444cffcf5ceb18d47766e5108c91f66723dcf30/FireCapture_v${version}.deb";
                    name = "FireCapture_v${version}.deb";
                    sha256 = "sha256-W1VXNfhcuF2ja9KfsaFpDq5F9VXNuQnV5yT2QCYZ67o=";
                    # Go to http://www.firecapture.de/download.php?file=FireCapture_v2.7.15.deb
                    # to find the current question and cookie
                    #curlOpts = "-d password=4 --cookie PHPSESSID=bda3800509743212994d7a05f3ca1f90";
                };

                nativeBuildInputs = with pkgs; [
                    autoPatchelfHook
                    makeWrapper
                    copyDesktopItems
                    dpkg
                ];

                buildInputs = with pkgs; [
                    zlib
                    libxext
                    libx11
                    libxrender
                    libxtst
                    libxi
                    freetype
                    gcc-unwrapped
                    libusb1
                    alsa-lib
                ];

                desktopItems = [
                    desktopItem
                ];

                unpackCmd = "dpkg -x $curSrc .";

                setSourceRoot = ''
                    sourceRoot=$(echo opt/*)
                '';

                installPhase = ''
                    runHook preInstall
                    mkdir -p $out
                    cp -r * $out
                    # Set nonreparenting to fix blank window, on first run set up ~/.config/FireCapture to avoid logging to outPath
                    wrapProgram $out/start.sh --set _JAVA_AWT_WM_NONREPARENTING 1 --run "
                        export _JAVA_OPTIONS=-Duser.home=\$HOME/.config &&
                        mkdir -p ~/.config/FireCapture &&
                        cp --no-preserve=mode -rn $out/profiles ~/.config/FireCapture &&
                        cp --no-preserve=mode -n $out/FireCapture.ini ~/.config/FireCapture
                    "
                    # To fix the dependencies of AVIWriter_x64.so
                    ln -sfv avi_writer_x64.so $out/avi_writer.so.1
                    # Has to be done here after autoPatchelfHook removes the RPATH
                    # fontconfig isn't linked but is dlopened at runtime
                    function finalRPathFixups {
                        patchelf --add-rpath ${pkgs.fontconfig.lib}/lib $out/jre/lib/libawt_xawt.so
                    }
                    postFixupHooks+=(finalRPathFixups)
                    # Has to be done here after copyDesktopItems creates the file
                    function desktopItemSub {
                        substituteAllInPlace $out/share/applications/"FireCapture v2.7.desktop"
                    }
                    postInstallHooks+=(desktopItemSub)
                    runHook postInstall
                '';
            };
        });
    };
}
