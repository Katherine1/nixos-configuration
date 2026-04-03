{ 
    lib,
    stdenv,
    fetchgit,
    makeDesktopItem,
    copyDesktopItems,

    # Build Dependencies
    cmake,
    gcc,
    qt5,
}:
let
  desktopItem = makeDesktopItem {
    name = "fips";
    desktopName = "FIPS";
    exec = "fips";
    comment = "FIPS is a cross-platform FITS viewer with responsive user interface.";
    categories = [ "Education" ];
    icon = "fips";
    terminal = false;
  };
in
stdenv.mkDerivation rec {
  pname = "fips";
  version = "3.4.0";

  src = fetchgit {
    url = "https://github.com/matwey/fips3.git";
    rev = "refs/tags/${version}";
    sha256 = "";
  };

  nativeBuildInputs = [
    copyDesktopItems
    cmake
  ];

  buildInputs = [
    qt5.qtbase
  ];
    
  desktopItems = [ desktopItem ];

  meta = with lib; {
    description = "FIPS is a cross-platform FITS viewer with responsive user interface.";
    homepage = "https://fips.space/";
    license = licenses.lgpl3;
    platforms = platforms.linux;
  };
}
