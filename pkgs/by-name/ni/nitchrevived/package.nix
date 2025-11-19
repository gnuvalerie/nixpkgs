{ lib
, stdenv
, fetchurl
, autoPatchelfHook
}:

stdenv.mkDerivation rec {
  pname = "nitchrevived";
  version = "0.1.7.3";

  src = fetchurl {
    url = "https://github.com/gnuvalerie/nitchrevived/raw/binary/bin/nitchrevived";
    sha256 = "1hpmzscf5nv2v9pxccwdch2z98sc5n31cs49pk794pbcw02kjg80";
  };

  nativeBuildInputs = [ autoPatchelfHook ];

  unpackPhase = ":";
  configurePhase = ":";
  buildPhase = ":";

  installPhase = ''
    mkdir -p $out/bin
    cp -v $src $out/bin/nitchrevived
    chmod +x $out/bin/nitchrevived
  '';

  meta = with lib; {
    description = "Incredibly fast system fetch written in Nim";
    homepage = "https://github.com/gnuvalerie/nitchrevived";
    license = licenses.mit;
    maintainers = [ lib.maintainers.gnuvalerie ];
    platforms = platforms.linux;
  };
}
