{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "chinese-font";
  version = "1.0.0"; 

  src = pkgs.fetchFromGitHub {
    owner = "Ruomio";
    repo = "font";
    rev = "main"; # 或者固定一个 commit
    sha256 = "sha256-TbkfnjGazEciR1KxdtSHtKFTTbcQ3uXy9dFMSu1G+BQ=";
  };

  buildPhase = ''
    # nothing to do, just copy fonts
  '';

  installPhase = ''
    mkdir -p $out/share/fonts/ChineseFonts
    # copy all ttf/otf stuff
    find $src -type f \( -name '*.ttf' -o -name '*.ttc' \) -exec cp {} $out/share/fonts/ChineseFonts \;
  '';

  meta = with pkgs.lib; {
    description = "simsun, simhei, etc Chinese fonts";
    homepage = "https://github.com/Ruomio/font";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
