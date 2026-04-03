{
    description = "Astro Catalogue Viewer - Deep-sky catalog image organizer";

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
                pythonPkgs = pkgs.python313Packages;
                desktopItem = pkgs.makeDesktopItem {
                    name = "astro-catalogue-viewer";
                    desktopName = "Astro Catalogue Viewer";
                    exec = "astro-catalogue-viewer";
                    comment = "Astro Catalogue Viewer is a desktop app for organizing and browsing deep-sky catalog images (Messier, NGC, Caldwell, Solar system, and more).";
                    categories = [ "Education" ];
                    icon = "astro-catalogue-viewer";
                    terminal = false;
                };
            in {
                default = pythonPkgs.buildPythonApplication rec {
                    pname = "astro-catalogue-viewer";
                    version = "3.0-beta";
                    pyproject = false;

                    src = pkgs.fetchgit {
                        url = "https://github.com/thebioguy/Astro-Catalogue-Viewer.git";
                        rev = "refs/tags/v${version}";
                        sha256 = "sha256-/ODJvEyuBtj2uLIvEx5NfHtasj27o/AfDECw/gs1iNw=";
                    };

                    nativeBuildInputs = [
                        pkgs.copyDesktopItems
                        pythonPkgs.pyinstaller
                    ];

                    propagatedBuildInputs = with pythonPkgs; [
                        pyside6
                        numpy
                        tifffile
                        imagecodecs
                        pillow
                    ];

                    buildPhase = ''
                        runHook preBuild
                        pyinstaller --clean --noconfirm spec/AstroCatalogueViewer-linux.spec
                        runHook postBuild
                    '';

                    installPhase = ''
                        runHook preInstall
                        mkdir -p $out/bin $out/opt/$pname

                        cp -r "dist/Astro Catalogue Viewer" $out/opt/

                        chmod +x "$out/opt/Astro Catalogue Viewer/Astro Catalogue Viewer"
                        ln -s "$out/opt/Astro Catalogue Viewer/Astro Catalogue Viewer" $out/bin/astro-catalogue-viewer

                        install -Dm644 ${./astro-catalogue-viewer.png} $out/share/icons/hicolor/128x128/apps/astro-catalogue-viewer.png
                        runHook postInstall
                    '';

                    desktopItems = [ desktopItem ];

                    meta = with pkgs.lib; {
                        description = "Astro Catalogue Viewer is a desktop app for organizing and browsing deep-sky catalog images (Messier, NGC, Caldwell, Solar system, and more).";
                        homepage = "https://github.com/thebioguy/Astro-Catalogue-Viewer";
                        license = licenses.mit;
                        platforms = platforms.linux;
                    };
                };
        });
    };
}
